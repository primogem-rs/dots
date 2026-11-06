local map = vim.keymap.set
local augroup = vim.api.nvim_create_augroup("minimal_lsp", { clear = true })
local spinner = { "-", "\\", "|", "/" }
local lsp_progress = {}

vim.diagnostic.config({
  virtual_text = true,
  virtual_lines = false,
})

local function progress_token(token)
  if token == nil then
    return "unknown"
  end

  return tostring(token)
end

local function progress_message(value)
  local title = type(value.title) == "string" and vim.trim(value.title) or ""
  local message = type(value.message) == "string" and vim.trim(value.message) or ""
  local text = title

  if message ~= "" and message ~= title then
    text = text ~= "" and (text .. " " .. message) or message
  end

  if text == "" then
    text = value.kind == "end" and "done" or "working"
  end

  local percentage = tonumber(value.percentage)
  if percentage then
    percentage = math.max(0, math.min(100, math.floor(percentage + 0.5)))
    return ("[%3d%%] %s"):format(percentage, text)
  end

  return text
end

local function progress_items(client_id)
  local items = vim.tbl_values(lsp_progress[client_id] or {})

  table.sort(items, function(a, b)
    return a.updated < b.updated
  end)

  return items
end

vim.api.nvim_create_autocmd("LspProgress", {
  group = augroup,
  callback = function(event)
    local data = event.data or {}
    local client = data.client_id and vim.lsp.get_client_by_id(data.client_id)
    local params = data.params or {}
    local value = params and params.value

    if not client or type(value) ~= "table" or type(value.kind) ~= "string" then
      return
    end

    local client_progress = lsp_progress[client.id] or {}
    lsp_progress[client.id] = client_progress

    client_progress[progress_token(params.token)] = {
      msg = progress_message(value),
      done = value.kind == "end",
      updated = vim.uv.hrtime(),
    }

    local lines = {}
    local active_count = 0

    for _, item in ipairs(progress_items(client.id)) do
      table.insert(lines, item.msg)
      if not item.done then
        active_count = active_count + 1
      end
    end

    for token, item in pairs(client_progress) do
      if item.done then
        client_progress[token] = nil
      end
    end

    if active_count == 0 then
      lsp_progress[client.id] = nil
    end

    vim.notify(table.concat(lines, "\n"), vim.log.levels.INFO, {
      id = "lsp_progress_" .. client.id,
      title = client.name,
      timeout = active_count == 0 and 1200 or false,
      opts = function(notif)
        local running = lsp_progress[client.id] ~= nil
        notif.icon = running and spinner[math.floor(vim.uv.hrtime() / (1e6 * 120)) % #spinner + 1] or "OK"
      end,
    })
  end,
})

local function add_completion_trigger_characters(client)
  local completion = client.server_capabilities.completionProvider
  if not completion then
    return
  end

  local trigger_characters = completion.triggerCharacters or {}
  local seen = {}

  for _, char in ipairs(trigger_characters) do
    seen[char] = true
  end

  for char in ("abcdefghijklmnopqrstuvwxyzABCDEFGHIJKLMNOPQRSTUVWXYZ0123456789_"):gmatch(".") do
    if not seen[char] then
      table.insert(trigger_characters, char)
      seen[char] = true
    end
  end

  completion.triggerCharacters = trigger_characters
end

vim.api.nvim_create_autocmd("LspAttach", {
  group = augroup,
  callback = function(event)
    local opts = { buffer = event.buf }
    local client = vim.lsp.get_client_by_id(event.data.client_id)

    map("n", "K", vim.lsp.buf.hover, vim.tbl_extend("force", opts, { desc = "LSP hover" }))
    map("n", "<leader>k", vim.lsp.buf.hover, vim.tbl_extend("force", opts, { desc = "LSP hover" }))
    map("n", "gd", vim.lsp.buf.definition, vim.tbl_extend("force", opts, { desc = "LSP definition" }))
    map("n", "gD", function()
      Snacks.picker.lsp_declarations()
    end, vim.tbl_extend("force", opts, { desc = "LSP declaration" }))
    map("n", "gr", function()
      Snacks.picker.lsp_references()
    end, vim.tbl_extend("force", opts, { desc = "LSP references", nowait = true }))
    map("n", "gI", function()
      Snacks.picker.lsp_implementations()
    end, vim.tbl_extend("force", opts, { desc = "LSP implementation" }))
    map("n", "gy", function()
      Snacks.picker.lsp_type_definitions()
    end, vim.tbl_extend("force", opts, { desc = "LSP type definition" }))
    map("n", "<leader>r", vim.lsp.buf.rename, vim.tbl_extend("force", opts, { desc = "LSP rename" }))
    map("n", "<leader>rn", vim.lsp.buf.rename, vim.tbl_extend("force", opts, { desc = "LSP rename" }))
    map("n", "<leader>a", vim.lsp.buf.code_action, vim.tbl_extend("force", opts, { desc = "LSP code action" }))
    map("n", "<leader>ca", vim.lsp.buf.code_action, vim.tbl_extend("force", opts, { desc = "LSP code action" }))

    if client and client:supports_method("textDocument/completion") then
      add_completion_trigger_characters(client)
      vim.lsp.completion.enable(true, client.id, event.buf, { autotrigger = true })
    end
  end,
})

local function executable(name)
  return vim.fn.executable(name) == 1
end

local lsp_servers = {
  lua_ls = {
    cmd = { "lua-language-server" },
    filetypes = { "lua" },
    root_markers = {
      ".luarc.json",
      ".luarc.jsonc",
      ".luacheckrc",
      ".stylua.toml",
      "stylua.toml",
      "selene.toml",
      "selene.yml",
      ".git",
    },
    settings = {
      Lua = {
        diagnostics = {
          globals = { "vim" },
        },
      },
    },
  },
  rust_analyzer = {
    cmd = { "rust-analyzer" },
    filetypes = { "rust" },
    root_markers = { "Cargo.toml", "rust-project.json", ".git" },
  },
  gopls = {
    cmd = { "gopls" },
    filetypes = { "go", "gomod", "gowork", "gotmpl" },
    root_markers = { "go.work", "go.mod", ".git" },
  },
  zls = {
    cmd = { "zls" },
    filetypes = { "zig", "zir" },
    root_markers = { "build.zig", ".git" },
  },
}

for name, config in pairs(lsp_servers) do
  if executable(config.cmd[1]) then
    vim.lsp.config(name, config)
    vim.lsp.enable(name)
  end
end

return {
  {
    "folke/snacks.nvim",
    priority = 1000,
    lazy = false,
    dependencies = {
      { "nvim-mini/mini.icons", opts = {} },
    },
    opts = {
      notifier = {
        enabled = true,
      },
      picker = {
        enabled = true,
        ui_select = true,
        win = {
          input = {
            keys = {
              ["<S-Tab>"] = { "list_up", mode = { "i", "n" } },
              ["<Tab>"] = { "list_down", mode = { "i", "n" } },
            },
          },
          list = {
            keys = {
              ["<S-Tab>"] = { "list_up", mode = { "n", "x" } },
              ["<Tab>"] = { "list_down", mode = { "n", "x" } },
            },
          },
        },
      },
      input = {
        win = {
          keys = {
            i_s_tab = { "<S-Tab>", { "cmp_select_prev" }, mode = "i", expr = true },
            i_tab = { "<Tab>", { "cmp_select_next" }, mode = "i", expr = true },
          },
        },
      },
    },
  },
  {
    "nvim-mini/mini.ai",
    version = false,
    event = "VeryLazy",
    opts = function()
      local ai = require("mini.ai")

      return {
        n_lines = 500,
        custom_textobjects = {
          f = ai.gen_spec.treesitter({ a = "@function.outer", i = "@function.inner" }),
          c = ai.gen_spec.treesitter({ a = "@class.outer", i = "@class.inner" }),
          o = ai.gen_spec.treesitter({
            a = { "@block.outer", "@conditional.outer", "@loop.outer" },
            i = { "@block.inner", "@conditional.inner", "@loop.inner" },
          }),
        },
      }
    end,
  },
  {
    "nvim-mini/mini.pairs",
    version = false,
    event = "InsertEnter",
    opts = {},
  },
  {
    "nvim-treesitter/nvim-treesitter",
    branch = "main",
    build = ":TSUpdate",
    opts = {
      ensure_installed = {
        "go",
        "gomod",
        "gowork",
        "lua",
        "markdown",
        "markdown_inline",
        "query",
        "rust",
        "vim",
        "vimdoc",
        "zig",
      },
      highlight = { enable = true },
      indent = { enable = true },
    },
    config = function(_, opts)
      local ts = require("nvim-treesitter")

      if not ts.get_installed then
        vim.notify("Run :Lazy sync to update nvim-treesitter to the main branch", vim.log.levels.WARN)
        return
      end

      local function enabled(feature, lang)
        local config = opts[feature] or {}
        return config.enable ~= false and not (type(config.disable) == "table" and vim.tbl_contains(config.disable, lang))
      end

      local function has_parser(lang)
        return pcall(vim.treesitter.language.add, lang)
      end

      local function has_query(lang, query)
        local ok, parser_query = pcall(vim.treesitter.query.get, lang, query)
        return ok and parser_query ~= nil
      end

      ts.setup(opts)

      vim.api.nvim_create_autocmd("FileType", {
        group = vim.api.nvim_create_augroup("user_treesitter", { clear = true }),
        callback = function(ev)
          local lang = vim.treesitter.language.get_lang(ev.match) or ev.match

          if not has_parser(lang) then
            return
          end

          if enabled("highlight", lang) and has_query(lang, "highlights") then
            pcall(vim.treesitter.start, ev.buf)
          end

          if enabled("indent", lang) and has_query(lang, "indents") then
            vim.bo[ev.buf].indentexpr = "v:lua.require'nvim-treesitter'.indentexpr()"
          end
        end,
      })
    end,
  },
  {
    "nvim-treesitter/nvim-treesitter-textobjects",
    branch = "main",
    dependencies = { "nvim-treesitter/nvim-treesitter" },
    opts = {
      select = {
        lookahead = true,
      },
      move = {
        set_jumps = true,
      },
    },
    config = function(_, opts)
      local ts_textobjects = require("nvim-treesitter-textobjects")

      if not ts_textobjects.setup then
        vim.notify("Run :Lazy sync to update nvim-treesitter-textobjects to the main branch", vim.log.levels.WARN)
        return
      end

      ts_textobjects.setup(opts)

      local function has_parser(lang)
        return pcall(vim.treesitter.language.add, lang)
      end

      local function has_query(lang, query)
        local ok, parser_query = pcall(vim.treesitter.query.get, lang, query)
        return ok and parser_query ~= nil
      end

      local select_keymaps = {
        af = { query = "@function.outer", desc = "Around function" },
        ["if"] = { query = "@function.inner", desc = "Inside function" },
        ac = { query = "@class.outer", desc = "Around class" },
        ic = { query = "@class.inner", desc = "Inside class" },
        aa = { query = "@parameter.outer", desc = "Around argument" },
        ia = { query = "@parameter.inner", desc = "Inside argument" },
        ab = { query = "@block.outer", desc = "Around block" },
        ib = { query = "@block.inner", desc = "Inside block" },
      }

      local move_keymaps = {
        goto_next_start = {
          ["]f"] = "@function.outer",
          ["]c"] = "@class.outer",
          ["]a"] = "@parameter.inner",
        },
        goto_next_end = {
          ["]F"] = "@function.outer",
          ["]C"] = "@class.outer",
          ["]A"] = "@parameter.inner",
        },
        goto_previous_start = {
          ["[f"] = "@function.outer",
          ["[c"] = "@class.outer",
          ["[a"] = "@parameter.inner",
        },
        goto_previous_end = {
          ["[F"] = "@function.outer",
          ["[C"] = "@class.outer",
          ["[A"] = "@parameter.inner",
        },
      }

      local function attach(buf)
        local ft = vim.bo[buf].filetype
        local lang = vim.treesitter.language.get_lang(ft) or ft

        if not has_parser(lang) or not has_query(lang, "textobjects") then
          return
        end

        for key, spec in pairs(select_keymaps) do
          vim.keymap.set({ "x", "o" }, key, function()
            require("nvim-treesitter-textobjects.select").select_textobject(spec.query, "textobjects")
          end, { buffer = buf, desc = spec.desc, silent = true })
        end

        for method, keymaps in pairs(move_keymaps) do
          for key, query in pairs(keymaps) do
            vim.keymap.set({ "n", "x", "o" }, key, function()
              if vim.wo.diff and key:find("[cC]") then
                return vim.cmd("normal! " .. key)
              end
              require("nvim-treesitter-textobjects.move")[method](query, "textobjects")
            end, { buffer = buf, desc = "Treesitter textobject move", silent = true })
          end
        end
      end

      vim.api.nvim_create_autocmd("FileType", {
        group = vim.api.nvim_create_augroup("user_treesitter_textobjects", { clear = true }),
        callback = function(ev)
          attach(ev.buf)
        end,
      })

      vim.tbl_map(attach, vim.api.nvim_list_bufs())
    end,
  },
}

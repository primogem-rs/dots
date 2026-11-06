-- JetBrains New UI / Islands inspired colorscheme.
-- Local theme: :colorscheme jetbrains-islands

vim.cmd("highlight clear")
if vim.fn.exists("syntax_on") == 1 then
  vim.cmd("syntax reset")
end

vim.o.background = "dark"
vim.o.termguicolors = true
vim.g.colors_name = "jetbrains-islands"

local c = {
  bg = "#1e1f22",
  bg_dark = "#191a1d",
  bg_gutter = "#202124",
  panel = "#25272b",
  island = "#2b2d30",
  island_active = "#313338",
  island_hover = "#383b40",
  selection = "#2e436e",
  selection_soft = "#26324a",
  search = "#554b25",
  border = "#4e5157",
  border_dim = "#3d3f45",

  fg = "#bcbec4",
  fg_bright = "#d5d7de",
  fg_dim = "#8a8d93",
  muted = "#6f737a",
  comment = "#7a7e85",

  blue = "#6aa6f8",
  blue_ui = "#3574f0",
  cyan = "#2aacb8",
  teal = "#3bd3c8",
  green = "#6aab73",
  yellow = "#d9a343",
  orange = "#cf8e6d",
  red = "#f75464",
  purple = "#c77dff",
  magenta = "#d86bd6",

  none = "NONE",
}

local function hl(group, opts)
  vim.api.nvim_set_hl(0, group, opts)
end

local function link(group, target)
  hl(group, { link = target })
end

-- Terminal ANSI palette
vim.g.terminal_color_0 = c.bg_dark
vim.g.terminal_color_1 = c.red
vim.g.terminal_color_2 = c.green
vim.g.terminal_color_3 = c.yellow
vim.g.terminal_color_4 = c.blue
vim.g.terminal_color_5 = c.purple
vim.g.terminal_color_6 = c.cyan
vim.g.terminal_color_7 = c.fg
vim.g.terminal_color_8 = c.muted
vim.g.terminal_color_9 = c.red
vim.g.terminal_color_10 = c.green
vim.g.terminal_color_11 = c.orange
vim.g.terminal_color_12 = c.blue
vim.g.terminal_color_13 = c.magenta
vim.g.terminal_color_14 = c.teal
vim.g.terminal_color_15 = c.fg_bright

-- Editor chrome
hl("Normal", { fg = c.fg, bg = c.bg })
hl("NormalNC", { fg = c.fg, bg = c.bg })
hl("NormalFloat", { fg = c.fg, bg = c.island })
hl("FloatBorder", { fg = c.border, bg = c.island })
hl("FloatTitle", { fg = c.fg_bright, bg = c.island, bold = true })
hl("FloatFooter", { fg = c.muted, bg = c.island })
hl("MsgArea", { fg = c.fg, bg = c.bg })
hl("ModeMsg", { fg = c.green, bold = true })
hl("MoreMsg", { fg = c.green })
hl("Question", { fg = c.blue })
hl("ErrorMsg", { fg = c.red, bold = true })
hl("WarningMsg", { fg = c.orange, bold = true })
hl("NonText", { fg = c.muted })
hl("EndOfBuffer", { fg = c.bg })
hl("Whitespace", { fg = c.border_dim })
hl("SpecialKey", { fg = c.muted })
hl("Conceal", { fg = c.muted })
hl("Directory", { fg = c.blue })
hl("Title", { fg = c.fg_bright, bold = true })

hl("Cursor", { fg = c.bg, bg = c.fg_bright })
hl("lCursor", { fg = c.bg, bg = c.fg_bright })
hl("CursorIM", { fg = c.bg, bg = c.fg_bright })
hl("CursorLine", { bg = c.panel })
hl("CursorColumn", { bg = c.panel })
hl("ColorColumn", { bg = c.panel })
hl("CursorLineNr", { fg = c.fg_bright, bg = c.panel, bold = true })
hl("LineNr", { fg = c.muted })
hl("LineNrAbove", { fg = c.muted })
hl("LineNrBelow", { fg = c.muted })
hl("SignColumn", { fg = c.muted, bg = c.bg })
hl("FoldColumn", { fg = c.muted, bg = c.bg })
hl("Folded", { fg = c.fg_dim, bg = c.panel })
hl("VertSplit", { fg = c.border_dim, bg = c.bg })
hl("WinSeparator", { fg = c.border_dim, bg = c.bg })

hl("StatusLine", { fg = c.fg, bg = c.island })
hl("StatusLineNC", { fg = c.fg_dim, bg = c.panel })
hl("StatusLineTerm", { fg = c.fg, bg = c.island })
hl("StatusLineTermNC", { fg = c.fg_dim, bg = c.panel })
hl("WinBar", { fg = c.fg_bright, bg = c.bg, bold = true })
hl("WinBarNC", { fg = c.fg_dim, bg = c.bg })
hl("TabLine", { fg = c.fg_dim, bg = c.panel })
hl("TabLineSel", { fg = c.fg_bright, bg = c.bg, bold = true })
hl("TabLineFill", { bg = c.bg_dark })

hl("Visual", { bg = c.selection })
hl("VisualNOS", { bg = c.selection_soft })
hl("Search", { fg = c.fg_bright, bg = c.search })
hl("IncSearch", { fg = c.bg_dark, bg = c.yellow, bold = true })
hl("CurSearch", { fg = c.bg_dark, bg = c.yellow, bold = true })
hl("Substitute", { fg = c.bg_dark, bg = c.orange, bold = true })
hl("MatchParen", { fg = c.fg_bright, bg = c.island_hover, bold = true })
hl("QuickFixLine", { bg = c.selection_soft, bold = true })
hl("WildMenu", { fg = c.fg_bright, bg = c.selection })

-- Popup menu / completion islands
hl("Pmenu", { fg = c.fg, bg = c.island })
hl("PmenuSel", { fg = c.fg_bright, bg = c.selection, bold = true })
hl("PmenuKind", { fg = c.purple, bg = c.island })
hl("PmenuKindSel", { fg = c.fg_bright, bg = c.selection })
hl("PmenuExtra", { fg = c.muted, bg = c.island })
hl("PmenuExtraSel", { fg = c.fg, bg = c.selection })
hl("PmenuSbar", { bg = c.island_active })
hl("PmenuThumb", { bg = c.border })

-- Diffs / vcs
hl("DiffAdd", { fg = c.none, bg = "#213629" })
hl("DiffChange", { fg = c.none, bg = "#303329" })
hl("DiffDelete", { fg = c.red, bg = "#3a2528" })
hl("DiffText", { fg = c.none, bg = "#3d472d" })
hl("Added", { fg = c.green })
hl("Changed", { fg = c.yellow })
hl("Removed", { fg = c.red })
hl("GitSignsAdd", { fg = c.green, bg = c.bg })
hl("GitSignsChange", { fg = c.yellow, bg = c.bg })
hl("GitSignsDelete", { fg = c.red, bg = c.bg })
hl("GitSignsAddNr", { fg = c.green, bg = c.panel })
hl("GitSignsChangeNr", { fg = c.yellow, bg = c.panel })
hl("GitSignsDeleteNr", { fg = c.red, bg = c.panel })
hl("GitSignsAddLn", { bg = "#213629" })
hl("GitSignsChangeLn", { bg = "#303329" })
hl("GitSignsDeleteLn", { bg = "#3a2528" })
link("GitSignsTopdelete", "GitSignsDelete")
link("GitSignsChangedelete", "GitSignsChange")
link("GitSignsUntracked", "GitSignsAdd")

-- Diagnostics
hl("DiagnosticError", { fg = c.red })
hl("DiagnosticWarn", { fg = c.orange })
hl("DiagnosticInfo", { fg = c.blue })
hl("DiagnosticHint", { fg = c.cyan })
hl("DiagnosticOk", { fg = c.green })
hl("DiagnosticSignError", { fg = c.red, bg = c.bg })
hl("DiagnosticSignWarn", { fg = c.orange, bg = c.bg })
hl("DiagnosticSignInfo", { fg = c.blue, bg = c.bg })
hl("DiagnosticSignHint", { fg = c.cyan, bg = c.bg })
hl("DiagnosticSignOk", { fg = c.green, bg = c.bg })
hl("DiagnosticVirtualTextError", { fg = c.red, bg = "#352327" })
hl("DiagnosticVirtualTextWarn", { fg = c.orange, bg = "#342d22" })
hl("DiagnosticVirtualTextInfo", { fg = c.blue, bg = "#223047" })
hl("DiagnosticVirtualTextHint", { fg = c.cyan, bg = "#203437" })
hl("DiagnosticVirtualTextOk", { fg = c.green, bg = "#213629" })
hl("DiagnosticFloatingError", { fg = c.red, bg = c.island })
hl("DiagnosticFloatingWarn", { fg = c.orange, bg = c.island })
hl("DiagnosticFloatingInfo", { fg = c.blue, bg = c.island })
hl("DiagnosticFloatingHint", { fg = c.cyan, bg = c.island })
hl("DiagnosticFloatingOk", { fg = c.green, bg = c.island })
hl("DiagnosticUnderlineError", { sp = c.red, undercurl = true })
hl("DiagnosticUnderlineWarn", { sp = c.orange, undercurl = true })
hl("DiagnosticUnderlineInfo", { sp = c.blue, undercurl = true })
hl("DiagnosticUnderlineHint", { sp = c.cyan, undercurl = true })
hl("DiagnosticUnderlineOk", { sp = c.green, undercurl = true })

-- Base syntax: JetBrains-like semantics
hl("Comment", { fg = c.comment, italic = true })
hl("Constant", { fg = c.purple })
hl("String", { fg = c.green })
hl("Character", { fg = c.green })
hl("Number", { fg = c.cyan })
hl("Boolean", { fg = c.orange })
hl("Float", { fg = c.cyan })
hl("Identifier", { fg = c.fg })
hl("Function", { fg = c.blue })
hl("Statement", { fg = c.orange })
hl("Conditional", { fg = c.orange })
hl("Repeat", { fg = c.orange })
hl("Label", { fg = c.orange })
hl("Operator", { fg = c.orange })
hl("Keyword", { fg = c.orange })
hl("Exception", { fg = c.orange })
hl("PreProc", { fg = c.orange })
hl("Include", { fg = c.orange })
hl("Define", { fg = c.orange })
hl("Macro", { fg = c.purple })
hl("PreCondit", { fg = c.orange })
hl("Type", { fg = c.purple })
hl("StorageClass", { fg = c.orange })
hl("Structure", { fg = c.purple })
hl("Typedef", { fg = c.purple })
hl("Special", { fg = c.blue })
hl("SpecialChar", { fg = c.cyan })
hl("Tag", { fg = c.blue })
hl("Delimiter", { fg = c.fg_dim })
hl("SpecialComment", { fg = c.comment, italic = true })
hl("Debug", { fg = c.red })
hl("Underlined", { fg = c.blue, underline = true })
hl("Ignore", { fg = c.muted })
hl("Error", { fg = c.red })
hl("Todo", { fg = c.bg_dark, bg = c.yellow, bold = true })

-- Treesitter captures
link("@none", "Normal")
link("@comment", "Comment")
link("@comment.documentation", "Comment")
hl("@punctuation.delimiter", { fg = c.fg_dim })
hl("@punctuation.bracket", { fg = c.fg_dim })
hl("@punctuation.special", { fg = c.orange })
link("@string", "String")
link("@string.documentation", "String")
hl("@string.escape", { fg = c.cyan })
hl("@string.regexp", { fg = c.cyan })
hl("@string.special", { fg = c.cyan })
hl("@string.special.symbol", { fg = c.purple })
hl("@string.special.url", { fg = c.blue, underline = true })
link("@character", "Character")
link("@character.special", "SpecialChar")
link("@boolean", "Boolean")
link("@number", "Number")
link("@number.float", "Float")
hl("@constant", { fg = c.purple })
hl("@constant.builtin", { fg = c.orange })
hl("@constant.macro", { fg = c.purple })
hl("@variable", { fg = c.fg })
hl("@variable.builtin", { fg = c.orange })
hl("@variable.parameter", { fg = c.fg_bright })
hl("@variable.member", { fg = c.fg })
hl("@module", { fg = c.fg })
hl("@label", { fg = c.orange })
hl("@function", { fg = c.blue })
hl("@function.call", { fg = c.blue })
hl("@function.builtin", { fg = c.blue })
hl("@function.macro", { fg = c.purple })
hl("@function.method", { fg = c.blue })
hl("@function.method.call", { fg = c.blue })
hl("@constructor", { fg = c.purple })
hl("@operator", { fg = c.orange })
hl("@keyword", { fg = c.orange })
hl("@keyword.coroutine", { fg = c.orange })
hl("@keyword.function", { fg = c.orange })
hl("@keyword.operator", { fg = c.orange })
hl("@keyword.import", { fg = c.orange })
hl("@keyword.type", { fg = c.orange })
hl("@keyword.modifier", { fg = c.orange })
hl("@keyword.repeat", { fg = c.orange })
hl("@keyword.return", { fg = c.orange })
hl("@keyword.debug", { fg = c.orange })
hl("@keyword.exception", { fg = c.orange })
hl("@keyword.conditional", { fg = c.orange })
hl("@keyword.directive", { fg = c.orange })
hl("@keyword.directive.define", { fg = c.orange })
hl("@type", { fg = c.purple })
hl("@type.builtin", { fg = c.purple })
hl("@type.definition", { fg = c.purple })
hl("@attribute", { fg = c.yellow })
hl("@property", { fg = c.fg })
hl("@tag", { fg = c.orange })
hl("@tag.attribute", { fg = c.yellow })
hl("@tag.delimiter", { fg = c.fg_dim })

-- Markup / markdown captures
hl("@markup.heading", { fg = c.orange, bold = true })
hl("@markup.heading.1", { fg = c.orange, bold = true })
hl("@markup.heading.2", { fg = c.yellow, bold = true })
hl("@markup.heading.3", { fg = c.green, bold = true })
hl("@markup.heading.4", { fg = c.blue, bold = true })
hl("@markup.strong", { bold = true })
hl("@markup.italic", { italic = true })
hl("@markup.strikethrough", { strikethrough = true })
hl("@markup.underline", { underline = true })
hl("@markup.link", { fg = c.blue, underline = true })
hl("@markup.link.label", { fg = c.purple })
hl("@markup.link.url", { fg = c.blue, underline = true })
hl("@markup.raw", { fg = c.green })
hl("@markup.raw.block", { fg = c.green })
hl("@markup.list", { fg = c.orange })
hl("@markup.quote", { fg = c.comment, italic = true })

-- Legacy Treesitter captures
link("TSComment", "Comment")
link("TSString", "String")
link("TSNumber", "Number")
link("TSBoolean", "Boolean")
link("TSFunction", "Function")
link("TSMethod", "Function")
link("TSKeyword", "Keyword")
link("TSType", "Type")
link("TSVariable", "Identifier")

-- LSP semantic tokens
link("@lsp.type.comment", "@comment")
link("@lsp.type.decorator", "@attribute")
link("@lsp.type.enum", "@type")
link("@lsp.type.enumMember", "@constant")
link("@lsp.type.function", "@function")
link("@lsp.type.interface", "@type")
link("@lsp.type.macro", "@function.macro")
link("@lsp.type.method", "@function.method")
link("@lsp.type.namespace", "@module")
link("@lsp.type.parameter", "@variable.parameter")
link("@lsp.type.property", "@property")
link("@lsp.type.struct", "@type")
link("@lsp.type.type", "@type")
link("@lsp.type.typeParameter", "@type")
link("@lsp.type.variable", "@variable")
hl("@lsp.mod.deprecated", { strikethrough = true })
hl("LspSignatureActiveParameter", { fg = c.fg_bright, bg = c.selection_soft, bold = true })

-- blink.cmp / nvim-cmp completion
hl("BlinkCmpMenu", { fg = c.fg, bg = c.island })
hl("BlinkCmpMenuBorder", { fg = c.border, bg = c.island })
hl("BlinkCmpMenuSelection", { fg = c.fg_bright, bg = c.selection, bold = true })
hl("BlinkCmpDoc", { fg = c.fg, bg = c.island })
hl("BlinkCmpDocBorder", { fg = c.border, bg = c.island })
hl("BlinkCmpDocSeparator", { fg = c.border_dim, bg = c.island })
hl("BlinkCmpDocCursorLine", { bg = c.island_hover })
hl("BlinkCmpSignatureHelp", { fg = c.fg, bg = c.island })
hl("BlinkCmpSignatureHelpBorder", { fg = c.border, bg = c.island })
hl("BlinkCmpGhostText", { fg = c.muted, italic = true })
hl("BlinkCmpLabel", { fg = c.fg, bg = c.island })
hl("BlinkCmpLabelMatch", { fg = c.blue, bg = c.island, bold = true })
hl("BlinkCmpLabelDeprecated", { fg = c.muted, bg = c.island, strikethrough = true })
hl("BlinkCmpLabelDetail", { fg = c.muted, bg = c.island })
hl("BlinkCmpLabelDescription", { fg = c.muted, bg = c.island })
hl("BlinkCmpKind", { fg = c.purple, bg = c.island })
hl("BlinkCmpSource", { fg = c.muted, bg = c.island })

hl("CmpItemAbbr", { fg = c.fg, bg = c.island })
hl("CmpItemAbbrMatch", { fg = c.blue, bg = c.island, bold = true })
hl("CmpItemAbbrDeprecated", { fg = c.muted, bg = c.island, strikethrough = true })
hl("CmpItemKind", { fg = c.purple, bg = c.island })
hl("CmpItemMenu", { fg = c.muted, bg = c.island })

-- Which-key islands
hl("WhichKeyNormal", { fg = c.fg, bg = c.island })
hl("WhichKeyBorder", { fg = c.border, bg = c.island })
hl("WhichKeyTitle", { fg = c.fg_bright, bg = c.island, bold = true })
hl("WhichKey", { fg = c.blue, bg = c.island, bold = true })
hl("WhichKeyGroup", { fg = c.orange, bg = c.island })
hl("WhichKeyDesc", { fg = c.fg, bg = c.island })
hl("WhichKeySeparator", { fg = c.muted, bg = c.island })
hl("WhichKeyValue", { fg = c.comment, bg = c.island })
hl("WhichKeyIcon", { fg = c.blue, bg = c.island })
hl("WhichKeyIconAzure", { fg = c.cyan, bg = c.island })
hl("WhichKeyIconBlue", { fg = c.blue, bg = c.island })
hl("WhichKeyIconCyan", { fg = c.cyan, bg = c.island })
hl("WhichKeyIconGreen", { fg = c.green, bg = c.island })
hl("WhichKeyIconGrey", { fg = c.fg_dim, bg = c.island })
hl("WhichKeyIconOrange", { fg = c.orange, bg = c.island })
hl("WhichKeyIconPurple", { fg = c.purple, bg = c.island })
hl("WhichKeyIconRed", { fg = c.red, bg = c.island })
hl("WhichKeyIconYellow", { fg = c.yellow, bg = c.island })

-- Snacks floating UI / picker islands
hl("SnacksBackdrop", { bg = "#000000" })
hl("SnacksNormal", { fg = c.fg, bg = c.island })
hl("SnacksNormalNC", { fg = c.fg_dim, bg = c.island })
hl("SnacksTitle", { fg = c.fg_bright, bg = c.island, bold = true })
hl("SnacksFooter", { fg = c.muted, bg = c.island })
hl("SnacksFooterKey", { fg = c.blue, bg = c.island })
hl("SnacksFooterDesc", { fg = c.fg_dim, bg = c.island })
hl("SnacksWinBar", { fg = c.fg_bright, bg = c.island, bold = true })
hl("SnacksWinBarNC", { fg = c.fg_dim, bg = c.island })
hl("SnacksWinSeparator", { fg = c.border_dim, bg = c.bg })
hl("SnacksWinKey", { fg = c.blue, bold = true })
hl("SnacksWinKeySep", { fg = c.muted })
hl("SnacksWinKeyDesc", { fg = c.fg })

hl("SnacksInputNormal", { fg = c.fg, bg = c.island })
hl("SnacksInputBorder", { fg = c.border, bg = c.island })
hl("SnacksInputTitle", { fg = c.blue, bg = c.island, bold = true })
hl("SnacksInputIcon", { fg = c.cyan, bg = c.island })

local picker_windows = { "SnacksPicker", "SnacksPickerBox", "SnacksPickerInput", "SnacksPickerList", "SnacksPickerPreview" }
for _, group in ipairs(picker_windows) do
  hl(group, { fg = c.fg, bg = c.island })
  hl(group .. "Border", { fg = c.border, bg = c.island })
  hl(group .. "Title", { fg = c.fg_bright, bg = c.island, bold = true })
  hl(group .. "Footer", { fg = c.muted, bg = c.island })
  hl(group .. "CursorLine", { fg = c.fg_bright, bg = c.island_hover })
end
hl("SnacksPickerPrompt", { fg = c.blue, bg = c.island, bold = true })
hl("SnacksPickerInputSearch", { fg = c.fg_bright, bg = c.island })
hl("SnacksPickerMatch", { fg = c.blue, bg = c.none, bold = true })
hl("SnacksPickerSearch", { fg = c.yellow, bg = c.search })
hl("SnacksPickerSpecial", { fg = c.blue })
hl("SnacksPickerLabel", { fg = c.fg })
hl("SnacksPickerTotals", { fg = c.muted })
hl("SnacksPickerFile", { fg = c.fg })
hl("SnacksPickerDirectory", { fg = c.blue })
hl("SnacksPickerDir", { fg = c.muted })
hl("SnacksPickerPathIgnored", { fg = c.muted })
hl("SnacksPickerPathHidden", { fg = c.muted })
hl("SnacksPickerRow", { fg = c.green })
hl("SnacksPickerCol", { fg = c.yellow })
hl("SnacksPickerComment", { fg = c.comment, italic = true })
hl("SnacksPickerDesc", { fg = c.comment })
hl("SnacksPickerDelim", { fg = c.muted })
hl("SnacksPickerSpinner", { fg = c.blue })
hl("SnacksPickerSelected", { fg = c.green })
hl("SnacksPickerUnselected", { fg = c.muted })
hl("SnacksPickerIdx", { fg = c.yellow })
hl("SnacksPickerBold", { fg = c.fg_bright, bold = true })
hl("SnacksPickerItalic", { fg = c.fg, italic = true })
hl("SnacksPickerCode", { fg = c.green, bg = c.panel })
hl("SnacksPickerTree", { fg = c.border })
hl("SnacksPickerTime", { fg = c.purple })
hl("SnacksPickerIcon", { fg = c.blue })
hl("SnacksPickerIconSource", { fg = c.cyan })
hl("SnacksPickerIconName", { fg = c.fg })
hl("SnacksPickerIconCategory", { fg = c.purple })
hl("SnacksPickerGitStatusAdded", { fg = c.green })
hl("SnacksPickerGitStatusModified", { fg = c.yellow })
hl("SnacksPickerGitStatusDeleted", { fg = c.red })
hl("SnacksPickerGitStatusUntracked", { fg = c.muted })
hl("SnacksPickerGitStatusStaged", { fg = c.green })
hl("SnacksPickerGitStatusUnmerged", { fg = c.red })
hl("SnacksPickerGitBranch", { fg = c.blue })
hl("SnacksPickerGitBranchCurrent", { fg = c.green })
hl("SnacksPickerGitCommit", { fg = c.purple })
hl("SnacksPickerGitAuthor", { fg = c.orange })
hl("SnacksPickerGitDate", { fg = c.muted })
hl("SnacksPickerGitIssue", { fg = c.blue })
hl("SnacksPickerDiagnosticSource", { fg = c.comment })
hl("SnacksPickerDiagnosticCode", { fg = c.purple })

-- Snacks notifier levels
hl("SnacksNotifierMinimal", { fg = c.fg, bg = c.island })
hl("SnacksNotifierHistory", { fg = c.fg, bg = c.bg })
hl("SnacksNotifierHistoryTitle", { fg = c.fg_bright, bold = true })
hl("SnacksNotifierHistoryDateTime", { fg = c.muted })
local notifier_levels = {
  Info = c.blue,
  Warn = c.orange,
  Error = c.red,
  Debug = c.muted,
  Trace = c.muted,
}
for level, color in pairs(notifier_levels) do
  hl("SnacksNotifier" .. level, { fg = c.fg, bg = c.island })
  hl("SnacksNotifierIcon" .. level, { fg = color, bg = c.island })
  hl("SnacksNotifierBorder" .. level, { fg = c.border, bg = c.island })
  hl("SnacksNotifierTitle" .. level, { fg = color, bg = c.island, bold = true })
  hl("SnacksNotifierFooter" .. level, { fg = c.muted, bg = c.island })
end

-- Lazy.nvim island
hl("LazyNormal", { fg = c.fg, bg = c.island })
hl("LazyBackdrop", { bg = "#000000" })
hl("LazyH1", { fg = c.fg_bright, bg = c.blue_ui, bold = true })
hl("LazyH2", { fg = c.blue, bg = c.island, bold = true })
hl("LazyButton", { fg = c.fg, bg = c.panel })
hl("LazyButtonActive", { fg = c.fg_bright, bg = c.selection, bold = true })
hl("LazySpecial", { fg = c.blue })
hl("LazyComment", { fg = c.comment, italic = true })
hl("LazyDimmed", { fg = c.muted })
hl("LazyProp", { fg = c.purple })
hl("LazyValue", { fg = c.green })
hl("LazyUrl", { fg = c.blue, underline = true })
hl("LazyInfo", { fg = c.blue })
hl("LazyWarning", { fg = c.orange })
hl("LazyError", { fg = c.red })
hl("LazyReasonCmd", { fg = c.orange })
hl("LazyReasonEvent", { fg = c.purple })
hl("LazyReasonFt", { fg = c.green })
hl("LazyReasonImport", { fg = c.cyan })
hl("LazyReasonKeys", { fg = c.yellow })
hl("LazyReasonPlugin", { fg = c.blue })
hl("LazyReasonRuntime", { fg = c.magenta })
hl("LazyReasonSource", { fg = c.green })
hl("LazyReasonStart", { fg = c.blue })
hl("LazyProgressDone", { fg = c.blue })
hl("LazyProgressTodo", { fg = c.border_dim })
hl("LazyCommit", { fg = c.purple })
hl("LazyCommitIssue", { fg = c.blue })
hl("LazyCommitType", { fg = c.orange })
hl("LazyCommitScope", { fg = c.yellow, italic = true })

-- Noice / command-line popups
hl("NoiceCmdlinePopup", { fg = c.fg, bg = c.island })
hl("NoiceCmdlinePopupBorder", { fg = c.border, bg = c.island })
hl("NoiceCmdlinePopupTitle", { fg = c.blue, bg = c.island, bold = true })
hl("NoiceCmdlineIcon", { fg = c.blue, bg = c.island })
hl("NoicePopup", { fg = c.fg, bg = c.island })
hl("NoicePopupBorder", { fg = c.border, bg = c.island })
hl("NoicePopupmenu", { fg = c.fg, bg = c.island })
hl("NoicePopupmenuBorder", { fg = c.border, bg = c.island })
hl("NoicePopupmenuSelected", { fg = c.fg_bright, bg = c.selection })
hl("NoicePopupmenuMatch", { fg = c.blue, bg = c.none, bold = true })
hl("NoiceConfirm", { fg = c.fg, bg = c.island })
hl("NoiceConfirmBorder", { fg = c.border, bg = c.island })
hl("NoiceMini", { fg = c.fg, bg = c.island })
hl("NoiceVirtualText", { fg = c.blue })

-- Misc popular LazyVim plugins
hl("MasonNormal", { fg = c.fg, bg = c.island })
hl("MasonHeader", { fg = c.fg_bright, bg = c.blue_ui, bold = true })
hl("MasonHeaderSecondary", { fg = c.fg_bright, bg = c.selection, bold = true })
hl("MasonHighlight", { fg = c.blue })
hl("MasonHighlightBlock", { fg = c.fg_bright, bg = c.blue_ui })
hl("MasonHighlightBlockBold", { fg = c.fg_bright, bg = c.blue_ui, bold = true })
hl("MasonMuted", { fg = c.muted })
hl("MasonMutedBlock", { fg = c.fg_dim, bg = c.panel })

hl("TroubleNormal", { fg = c.fg, bg = c.bg })
hl("TroubleNormalNC", { fg = c.fg_dim, bg = c.bg })
hl("TroubleText", { fg = c.fg })
hl("TroubleCount", { fg = c.purple, bg = c.panel })
hl("TroublePreview", { bg = c.selection_soft })

hl("FlashBackdrop", { fg = c.muted })
hl("FlashMatch", { fg = c.fg_bright, bg = c.selection_soft })
hl("FlashCurrent", { fg = c.bg_dark, bg = c.yellow, bold = true })
hl("FlashLabel", { fg = c.bg_dark, bg = c.orange, bold = true })

hl("TodoBgTODO", { fg = c.bg_dark, bg = c.blue, bold = true })
hl("TodoBgFIX", { fg = c.bg_dark, bg = c.red, bold = true })
hl("TodoBgWARN", { fg = c.bg_dark, bg = c.orange, bold = true })
hl("TodoBgNOTE", { fg = c.bg_dark, bg = c.green, bold = true })
hl("TodoFgTODO", { fg = c.blue })
hl("TodoFgFIX", { fg = c.red })
hl("TodoFgWARN", { fg = c.orange })
hl("TodoFgNOTE", { fg = c.green })

-- Mini icons palette
hl("MiniIconsAzure", { fg = c.cyan })
hl("MiniIconsBlue", { fg = c.blue })
hl("MiniIconsCyan", { fg = c.cyan })
hl("MiniIconsGreen", { fg = c.green })
hl("MiniIconsGrey", { fg = c.fg_dim })
hl("MiniIconsOrange", { fg = c.orange })
hl("MiniIconsPurple", { fg = c.purple })
hl("MiniIconsRed", { fg = c.red })
hl("MiniIconsYellow", { fg = c.yellow })

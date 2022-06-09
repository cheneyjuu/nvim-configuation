local status_ok, onedark = pcall(require, "onedarkpro")
if not status_ok then
  return
end

onedark.setup({
  dark_theme = "onedark", -- The default dark theme
  light_theme = "onelight", -- The default light theme
  colors = {}, -- Override default colors by specifying colors for 'onelight' or 'onedark' themes
  hlgroups = {}, -- Override default highlight groups
  filetype_hlgroups = {}, -- Override default highlight groups for specific filetypes
  -- plugins = { -- Override which plugins highlight groups are loaded
  --     native_lsp = true,
  --     polygot = true,
  --     treesitter = true,
  --     -- NOTE: Other plugins have been omitted for brevity
  -- },
  -- styles = {
  --     strings = "NONE", -- Style that is applied to strings
  --     comments = "NONE", -- Style that is applied to comments
  --     keywords = "NONE", -- Style that is applied to keywords
  --     functions = "NONE", -- Style that is applied to functions
  --     variables = "NONE", -- Style that is applied to variables
  --     virtual_text = "NONE", -- Style that is applied to virtual text
  -- },
  options = {
      bold = true, -- Use the themes opinionated bold styles?
      italic = true, -- Use the themes opinionated italic styles?
      underline = false, -- Use the themes opinionated underline styles?
      undercurl = false, -- Use the themes opinionated undercurl styles?
      cursorline = false, -- Use cursorline highlighting?
      transparency = false, -- Use a transparent background?
      terminal_colors = false, -- Use the theme's colors for Neovim's :terminal?
      window_unfocussed_color = false, -- When the window is out of focus, change the normal background?
  }
})

onedark.load()

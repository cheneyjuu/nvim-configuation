local status_ok, monokai = pcall(require, "one_monokai")
if not status_ok then
  return
end

monokai.setup({
  transparent = false,
  colors = {
        -- green = "#00ff00",
        blue = "#0000ff",
        roman = "#e36965",
        lmao = "#282c34",
    },
    themes = function(colors)
        return {
            Normal = { bg = colors.lmao },
            Comment = { fg = colors.pink, italic = true },
            ErrorMsg = { fg = "black", bg = "#ec6075", standout = true },
            NormalFloat = { link = "Normal" },
        }
    end,
})

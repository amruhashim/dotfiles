local status_ok, kanagawa = pcall(require, "kanagawa")
if not status_ok then
  vim.notify("colorscheme kanagawa not found!")
  return
end

kanagawa.setup({
    compile = false,
    undercurl = true,
    commentStyle = { italic = true },
    functionStyle = {},
    keywordStyle = { italic = true },
    statementStyle = { bold = true },
    typeStyle = {},
    transparent = false,
    dimInactive = false,
    terminalColors = true,
    theme = "wave", -- or "dragon" for even more retro feel
    colors = {
        theme = {
            all = {
                ui = {
                    bg_gutter = "none"  -- Remove gutter background for cleaner look
                }
            }
        }
    },
    overrides = function(colors)
        local theme = colors.theme
        return {
            -- Clean floating windows (minimalistic)
            NormalFloat = { bg = "none" },
            FloatBorder = { bg = "none" },
            FloatTitle = { bg = "none" },
            
            -- Clean Telescope (if you use it)
            TelescopeTitle = { fg = theme.ui.special, bold = true },
            TelescopePromptNormal = { bg = theme.ui.bg_p1 },
            TelescopePromptBorder = { fg = theme.ui.bg_p1, bg = theme.ui.bg_p1 },
            TelescopeResultsNormal = { fg = theme.ui.fg_dim, bg = theme.ui.bg_m1 },
            TelescopeResultsBorder = { fg = theme.ui.bg_m1, bg = theme.ui.bg_m1 },
            TelescopePreviewNormal = { bg = theme.ui.bg_dim },
            TelescopePreviewBorder = { bg = theme.ui.bg_dim, fg = theme.ui.bg_dim },
        }
    end,
})

-- Apply the colorscheme
local colorscheme = "kanagawa"
local status_ok, _ = pcall(vim.cmd, "colorscheme " .. colorscheme)
if not status_ok then
  vim.notify("colorscheme " .. colorscheme .. " not found!")
  return
end
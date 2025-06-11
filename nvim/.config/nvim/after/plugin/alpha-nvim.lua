local status_ok, alpha = pcall(require, "alpha")
if not status_ok then
	return
end

local dashboard = require("alpha.themes.dashboard")

-- Set header with Assassin's Creed logo and welcome message
dashboard.section.header.val = {
	"                                                     ",
	"                    ⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⢠⣆⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀",
	"                    ⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⣾⣿⡆⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀",
	"                    ⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⣼⣿⣿⣿⡀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀",
	"                    ⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⣰⣿⠋⢿⣿⣷⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀",
	"                    ⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⢠⣿⡏⠀⠘⣿⣿⣧⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀",
	"                    ⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⢀⣿⡿⠀⠀⠀⠹⣿⣿⣆⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀",
	"                    ⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⣾⣿⠃⠀⠀⠀⠀⢹⣿⣿⡄⠀⠀⠀⠀⠀⠀⠀⠀⠀",
	"                    ⠀⠀⠀⠀⠀⠀⠀⠀⠀⣼⣿⠇⠀⠀⠀⠀⠀⠀⢻⣿⣷⡀⠀⠀⠀⠀⠀⠀⠀⠀",
	"                    ⠀⠀⠀⠀⠀⠀⠀⠀⣰⣿⡟⠀⠀⠀⠀⠀⠀⠀⠈⣿⣿⣧⠀⠀⠀⠀⠀⠀⠀⠀",
	"                    ⠀⠀⠀⠀⠀⠀⠀⢠⣿⣿⠁⠀⠀⠀⠀⠀⠀⠀⠀⠘⣿⣿⣧⠀⠀⠀⠀⠀⠀⠀",
	"                    ⠀⠀⠀⠀⠀⠀⣠⣿⣿⠇⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠹⣿⣿⣷⣄⠀⠀⠀⠀⠀",
	"                    ⠈⣶⣦⣤⣶⣿⣿⣿⡏⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⢹⣿⣿⣿⣿⣷⣶⣾⠇",
	"                    ⠀⢻⣿⣿⣿⣿⣿⡿⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⢿⣿⣿⣿⣿⣿⣿⠀",
	"                    ⠀⣼⣿⣿⣿⣿⣿⠃⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠈⣿⣿⣿⣿⣿⣿⠀",
	"                    ⠀⠛⠻⢿⣿⣿⣿⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⣸⣿⣿⡿⠟⠛⠃",
	"                    ⠀⠀⠀⠀⠙⠿⣿⣧⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⢠⣿⡿⠋⠀⠀⠀⠀",
	"                    ⠀⠀⠑⠄⡀⠀⠈⠙⠳⢦⣀⠀⠀⠀⠀⠀⠀⠀⠀⢀⡠⠶⠋⠁⠀⢀⡠⠊⠀⠀",
	"                    ⠀⠀⠀⠀⠈⠒⢤⣀⠀⠀⠀⠁⠀⠀⣠⣄⠀⠀⠀⠀⠀⠀⣀⡤⠒⠁⠀⠀⠀⠀",
	"                    ⠀⠀⠀⠀⠀⠀⠀⠈⠉⠛⠷⠶⢶⣿⣿⣿⣿⡷⠶⠾⠛⠋⠁⠀⠀⠀⠀⠀⠀⠀",
	"                                                     ",
	"        ██╗    ██╗███████╗██╗      ██████╗ ██████╗ ███╗   ███╗███████╗",
	"        ██║    ██║██╔════╝██║     ██╔════╝██╔═══██╗████╗ ████║██╔════╝",
	"        ██║ █╗ ██║█████╗  ██║     ██║     ██║   ██║██╔████╔██║█████╗  ",
	"        ██║███╗██║██╔══╝  ██║     ██║     ██║   ██║██║╚██╔╝██║██╔══╝  ",
	"        ╚███╔███╔╝███████╗███████╗╚██████╗╚██████╔╝██║ ╚═╝ ██║███████╗",
	"         ╚══╝╚══╝ ╚══════╝╚══════╝ ╚═════╝ ╚═════╝ ╚═╝     ╚═╝╚══════╝",
	"                                                     ",
	"           ███████ ██ ██████      █████ ██████ ███   ██  ██████ ",
	"           ██      ██ ██   ██    ██   █ ██   █ ████  ██ ██    █ ",
	"           ███████ ██ ██████     ███████ ██████ ██ ██ ██ ██    █ ",
	"                ██ ██ ██   ██    ██   █ ██   █ ██  ████ ██    █ ",
	"           ███████ ██ ██   ██    ██   █ ██   █ ██   ███  ██████ ",
	"                                                     ",
	"              Nothing is true, everything is permitted  ",
	"                                                     ",
}

-- Set menu
dashboard.section.buttons.val = {
	dashboard.button("e", "  > New Mission", "<cmd>ene<CR>"),
	dashboard.button("SPC ff", "  > Find Target", "<cmd>Telescope find_files<CR>"),
	dashboard.button("SPC fg", "  > Search Intel", "<cmd>Telescope live_grep<CR>"),
	dashboard.button("SPC fr", "  > Recent Files", "<cmd>Telescope oldfiles<CR>"),
	dashboard.button("SPC fh", "  > Harpoon", "<cmd>lua require('harpoon.ui').toggle_quick_menu()<CR>"),
	dashboard.button("c", "  > Brotherhood Config", "<cmd>edit ~/.config/nvim/init.lua<CR>"),
	dashboard.button("q", "  > Leave Animus", "<cmd>qa<CR>"),
}

-- Set footer
local function footer()
	local total_plugins = require("lazy").stats().count
	local datetime = os.date(" %d-%m-%Y   %H:%M:%S")
	local version = vim.version()
	local nvim_version_info = "   v" .. version.major .. "." .. version.minor .. "." .. version.patch
	return " " .. datetime .. "   " .. total_plugins .. " tools in arsenal" .. nvim_version_info .. " "
end

dashboard.section.footer.val = footer()

-- Disable folding on alpha buffer
dashboard.config.opts.noautocmd = true

-- Setup alpha
alpha.setup(dashboard.opts)

-- Disable statusline in dashboard
vim.cmd([[
    autocmd User AlphaReady set showtabline=0 | autocmd BufUnload <buffer> set showtabline=2
]])

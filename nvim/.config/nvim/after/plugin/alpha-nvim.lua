local status_ok, alpha = pcall(require, "alpha")
if not status_ok then
	vim.notify("Alpha-nvim not found!", vim.log.levels.ERROR)
	return
end
local dashboard_ok, dashboard = pcall(require, "alpha.themes.dashboard")
if not dashboard_ok then
	vim.notify("Alpha dashboard theme not found!", vim.log.levels.ERROR)
	return
end
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
	"    ██╗    ██╗███████╗██╗      ██████╗ ██████╗ ███╗   ███╗███████╗",
	"    ██║    ██║██╔════╝██║     ██╔════╝██╔═══██╗████╗ ████║██╔════╝",
	"    ██║ █╗ ██║█████╗  ██║     ██║     ██║   ██║██╔████╔██║█████╗  ",
	"    ██║███╗██║██╔══╝  ██║     ██║     ██║   ██║██║╚██╔╝██║██╔══╝  ",
	"    ╚███╔███╔╝███████╗███████╗╚██████╗╚██████╔╝██║ ╚═╝ ██║███████╗",
	"     ╚══╝╚══╝ ╚══════╝╚══════╝ ╚═════╝ ╚═════╝ ╚═╝     ╚═╝╚══════╝",
	"                                                     ",
	"       ███████ ██ ██████       █████  ██████  ███   ██  ██████ ",
	"       ██      ██ ██   ██     ██   ██ ██   ██ ████  ██ ██    ██",
	"       ███████ ██ ██████      ███████ ██████  ██ ██ ██ ██    ██",
	"            ██ ██ ██   ██     ██   ██ ██   ██ ██  ████ ██    ██",
	"       ███████ ██ ██   ██     ██   ██ ██   ██ ██   ███  ██████ ",
	"                                                     ",
	"               Nothing is true, everything is permitted  ",
	"                                                     ",
}
dashboard.section.buttons.val = {
	dashboard.button("e", "  > New Mission", "<cmd>ene<CR>"),
	dashboard.button("SPC ff", "  > Find Target", "<cmd>Telescope find_files<CR>"),
	dashboard.button("SPC fg", "  > Search Intel", "<cmd>Telescope live_grep<CR>"),
	dashboard.button("SPC fr", "  > Recent Files", "<cmd>Telescope oldfiles<CR>"),
	dashboard.button("SPC fh", "  > Harpoon", "<cmd>lua require('harpoon.ui').toggle_quick_menu()<CR>"),
	dashboard.button("c", "  > Brotherhood Config", "<cmd>edit ~/.config/nvim/init.lua<CR>"),
	dashboard.button("q", "  > Leave Animus", "<cmd>qa<CR>"),
}
local function footer()
	local total_plugins = require("lazy").stats().count
	local datetime = os.date(" %d-%m-%Y   %H:%M:%S")
	local version = vim.version()
	local nvim_version_info = "   v" .. version.major .. "." .. version.minor .. "." .. version.patch
	return " " .. datetime .. "   " .. total_plugins .. " tools in arsenal" .. nvim_version_info .. " "
end
dashboard.section.footer.val = footer()
dashboard.config.opts.noautocmd = true
alpha.setup(dashboard.opts)
vim.cmd([[
    autocmd User AlphaReady set showtabline=0 | autocmd BufUnload <buffer> set showtabline=2
]])

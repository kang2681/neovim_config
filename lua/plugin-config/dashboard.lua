local status, dashboard = pcall(require, "dashboard")
if not status then
    vim.notify("没有找到 Dashboard")
    return
end

dashboard.custom_header = {
	' ███╗   ██╗ ███████╗ ██████╗  ██╗   ██╗ ██╗ ███╗   ███╗',
	' ████╗  ██║ ██╔════╝██╔═══██╗ ██║   ██║ ██║ ████╗ ████║',
	' ██╔██╗ ██║ █████╗  ██║   ██║ ██║   ██║ ██║ ██╔████╔██║',
	' ██║╚██╗██║ ██╔══╝  ██║   ██║ ╚██╗ ██╔╝ ██║ ██║╚██╔╝██║',
	' ██║ ╚████║ ███████╗╚██████╔╝  ╚████╔╝  ██║ ██║ ╚═╝ ██║',
	' ╚═╝  ╚═══╝ ╚══════╝ ╚═════╝    ╚═══╝   ╚═╝ ╚═╝     ╚═╝',
}


dashboard.custom_center = {
	{
		icon = "  ",
		desc = "New file                            ",
		-- shortcut = ":enew",
		action = "enew",
	},
	{
		icon = "  ",
		desc = "Find file                           ",
		-- shortcut = "Telescope find_files",
		action = "Telescope find_files hidden=true no_ignore=true",
	},
	{
		icon = "  ",
		desc = "Projects                            ",
		-- shortcut = "Telescope projects",
		action = "Telescope projects",
	},
	{
		icon = "  ",
		desc = "Recently files                      ",
		-- shortcut = "Telescope oldfiles",
		action = "Telescope oldfiles",
	},
	{
		icon = "  ",
		desc = "Edit Projects                       ",
		-- shortcut = "edit ~/.local/share/nvim/project_nvim/project_history",
		action = "edit ~/.local/share/nvim/project_nvim/project_history",
	},
	{
		icon = "  ",
		desc = "Close neovim                        ",
		-- shortcut = ":qa!",
		action = "qa!",
	},
}

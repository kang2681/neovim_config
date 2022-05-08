vim.o.background = "dark" -- "light"
vim.g.tokyonight_style = "storm" -- day / night /storm
-- 半透明
vim.g.tokyonight_transparent = true
vim.g.tokyonight_transparent_sidebar = true
local colorscheme = "OceanicNext"
-- tokyonight
-- OceanicNext
-- gruvbox
-- zephyr
-- nord
-- onedark
-- nightfox
local status_ok, _ = pcall(vim.cmd, "colorscheme " .. colorscheme)
if not status_ok then
    vim.notify("colorscheme: " .. colorscheme .. " 没有找到！")
    return
end


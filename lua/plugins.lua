-- 自动安装 Packer.nvim
-- 插件安装目录
-- ~/.local/share/nvim/site/pack/packer/
local fn = vim.fn

local install_path = fn.stdpath('data')..'/site/pack/packer/start/packer.nvim'
if fn.empty(fn.glob(install_path)) > 0 then
    packer_bootstrap = fn.system({'git', 'clone', '--depth', '1', 'https://github.com/wbthomason/packer.nvim', install_path})
    print "Installing packer close and reopen Neovim..."
    vim.cmd [[packadd packer.nvim]]
    -- -- https://github.com/wbthomason/packer.nvim/issues/750
    -- local rtp_addition = vim.fn.stdpath("data") .. "/site/pack/*/start/*"
    -- if not string.find(vim.o.runtimepath, rtp_addition) then
    --     vim.o.runtimepath = rtp_addition .. "," .. vim.o.runtimepath
    -- end
    -- vim.notify("Pakcer.nvim 安装完毕")
end

return require('packer').startup(function(use)
    -- Packer 可以管理自己本身(包管理器)
    use('wbthomason/packer.nvim')
    -- colorschemes 主题 --
    use("folke/tokyonight.nvim")
    -- use("joshdick/onedark.vim")
    -- 侧边栏 nvim-tree (文件资源管理器)
    use({
        'kyazdani42/nvim-tree.lua',
        requires = {
            'kyazdani42/nvim-web-devicons', -- optional, for file icon
        },
        -- tag = 'nightly' -- optional, updated every week. (see issue #1193)
    })
    -- bufferline(标签栏)
    use({
        'akinsho/bufferline.nvim',
        tag = "v2.*", 
        requires = {
            'kyazdani42/nvim-web-devicons',
            'moll/vim-bbye',
        }
    })
    -- lualine(状态栏)
    use({
        'nvim-lualine/lualine.nvim',
        requires = { 'kyazdani42/nvim-web-devicons', opt = true }
    })
    -- telescope 文件搜索
    use({
        "nvim-telescope/telescope.nvim",
        requires = { "nvim-lua/plenary.nvim" },
    })
    -- 模糊搜索
    use({
        'nvim-telescope/telescope-fzf-native.nvim',
        run = 'make',
    })
    -- treesitter 语法高亮
    use({
        'nvim-treesitter/nvim-treesitter',
        run = ':TSUpdate'
    })
    -- dashboard-nvim
    use("glepnir/dashboard-nvim")
    -- project
    use("ahmedkhalf/project.nvim")
    -------------------- LSP --------------------
    use({ "williamboman/nvim-lsp-installer", commit = "36b44679f7cc73968dbb3b09246798a19f7c14e0" })
    -- Lspconfig
    use('neovim/nvim-lspconfig')
    if packer_bootstrap then
        require('packer').sync()
    end
end)


-- local packer = require("packer")
-- packer.startup({
--     function(use)
--         -- Packer 可以管理自己本身(包管理器)
--         use 'wbthomason/packer.nvim'
-- colorschemes 主题 --
        -- tokyonight
        --use("folke/tokyonight.nvim")
        -- OceanicNext
        --use("mhartington/oceanic-next")
        -- gruvbox
        --use({
        --    "ellisonleao/gruvbox.nvim",
        --    requires = { "rktjmp/lush.nvim" },
        --})
        -- nord
        --use("shaunsingh/nord.nvim")
        -- onedark
        --use("ful1e5/onedark.nvim")
        -- nightfox
        --use("EdenEast/nightfox.nvim")
        -------------------------------------------------------
        -- 侧边栏 nvim-tree --
        --use({
        --    "kyazdani42/nvim-tree.lua",
        --    requires = "kyazdani42/nvim-web-devicons",
        --})
        -- -------------------
        -- bufferline
        -- use({
        --    "akinsho/bufferline.nvim",
        --    requires = { "kyazdani42/nvim-web-devicons", "moll/vim-bbye" },
        --})
        -- lualine
        --use({
        --    "nvim-lualine/lualine.nvim",
        --    requires = { "kyazdani42/nvim-web-devicons" },
        --})
        --use("arkav/lualine-lsp-progress")
        -- telescope
        --use({
        --    "nvim-telescope/telescope.nvim",
        --    requires = { "nvim-lua/plenary.nvim" },
        --})
        -- telescope extensions
        --use("LinArcX/telescope-env.nvim")
        -- use("nvim-telescope/telescope-ui-select.nvim")
        -- dashboard-nvim
        -- use("glepnir/dashboard-nvim")
        -- project
        --use("ahmedkhalf/project.nvim")
        -- treesitter
        --use({
        --    "nvim-treesitter/nvim-treesitter",
        --    run = ":TSUpdate",
        --})
        -------------------- LSP --------------------
        -- use({ "williamboman/nvim-lsp-installer", commit = "36b44679f7cc73968dbb3b09246798a19f7c14e0" })
        -- Lspconfig
        -- use({ "neovim/nvim-lspconfig" })
        -- 补全引擎
        -- use("hrsh7th/nvim-cmp")
        -- Snippet 引擎
        -- use("hrsh7th/vim-vsnip")
        -- 补全源
        -- use("hrsh7th/cmp-vsnip")
        -- use("hrsh7th/cmp-nvim-lsp") -- { name = nvim_lsp }
        -- use("hrsh7th/cmp-buffer") -- { name = 'buffer' },
        -- use("hrsh7th/cmp-path") -- { name = 'path' }
        -- use("hrsh7th/cmp-cmdline") -- { name = 'cmdline' }
        -- use("hrsh7th/cmp-nvim-lsp-signature-help") -- { name = 'nvim_lsp_signature_help' }
        -- 常见编程语言代码段
        -- use("rafamadriz/friendly-snippets")
        -- UI 增强
        -- use("onsails/lspkind-nvim")
        -- use("tami5/lspsaga.nvim")
        -- 代码格式化
        -- use("mhartington/formatter.nvim")
        -- use({ "jose-elias-alvarez/null-ls.nvim", requires = "nvim-lua/plenary.nvim" })
        -- Lua 增强
        -- use("folke/lua-dev.nvim")
        -- JSON 增强
        -- use("b0o/schemastore.nvim")

        -- golang 插件
        -- use("fatih/vim-go")
--     end,
--     config = {
--         -- 并发数限制
--         max_jobs = 16,
--         -- 自定义源
--         git = {
--         },
--     },
-- })

--pcall(
--    vim.cmd,
--    [[
--        augroup packer_user_config
--        autocmd!
--        autocmd BufWritePost plugins.lua source <afile> | PackerInstall
--        augroup end
--    ]]
--)

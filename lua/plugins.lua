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

local status_ok, packer = pcall(require, "packer")
if not status_ok then
    vim.notify("没有安装 packer.nvim")
    return
end

packer.startup({
    function(use)
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
        -- use({ "williamboman/nvim-lsp-installer", commit = "36b44679f7cc73968dbb3b09246798a19f7c14e0" })
        use({ "williamboman/nvim-lsp-installer"})
        -- Lspconfig
        use('neovim/nvim-lspconfig')
        -- Lua 增强
        use("folke/lua-dev.nvim")
        -- 补全引擎
        use("hrsh7th/nvim-cmp")
         -- Snippet 引擎
        use("hrsh7th/vim-vsnip")
        use("hrsh7th/cmp-vsnip")
        use("hrsh7th/cmp-nvim-lsp") -- { name = nvim_lsp }
        use("hrsh7th/cmp-buffer") -- { name = 'buffer' },
        use("hrsh7th/cmp-path") -- { name = 'path' }
        use("hrsh7th/cmp-cmdline") -- { name = 'cmdline' }
        -- 常见编程语言代码段
        use("rafamadriz/friendly-snippets")
        -- JSON 增强
        use("b0o/schemastore.nvim")
        -- UI 增强
        use("onsails/lspkind-nvim")
        use("tami5/lspsaga.nvim")
        -------------------- LSP --------------------



        if packer_bootstrap then
            require('packer').sync()
        end
    end,
    config = {
        -- -- 锁定插件版本在snapshots目录
        -- snapshot_path = require("packer.util").join_paths(vim.fn.stdpath("config"), "snapshots"),
        -- -- 这里锁定插件版本在v1，不会继续更新插件
        -- snapshot = "v1",

        -- 最大并发数
        max_jobs = 16,
        -- 自定义源
        git = {
            -- default_url_format = "https://hub.fastgit.xyz/%s",
            -- default_url_format = "https://mirror.ghproxy.com/https://github.com/%s",
            -- default_url_format = "https://gitcode.net/mirrors/%s",
            -- default_url_format = "https://gitclone.com/github.com/%s",
        },
        -- display = {
        -- 使用浮动窗口显示
        --   open_fn = function()
        --     return require("packer.util").float({ border = "single" })
        --   end,
        -- },
    },
})

pcall(
    vim.cmd,
    [[
        augroup packer_user_config
        autocmd!
        autocmd BufWritePost plugins.lua source <afile> | PackerInstall
        augroup end
    ]]
)

in_wsl = os.getenv('WSL_DISTRO_NAME') ~= nil

if in_wsl then
    vim.g.clipboard = {
        name = 'wsl clipboard',
        copy =  { ["+"] = { "clip.exe" },   ["*"] = { "clip.exe" } },
        paste = { ["+"] = { "nvim_paste" }, ["*"] = { "nvim_paste" } },
        cache_enabled = true
    }
end
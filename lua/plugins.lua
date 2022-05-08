local packer = require("packer")
packer.startup({
    function(use)
        -- Packer 可以管理自己本身
        use 'wbthomason/packer.nvim'
        --------------------- colorschemes 主题 --------------------
        -- tokyonight
        use("folke/tokyonight.nvim")
        -- OceanicNext
        use("mhartington/oceanic-next")
        -- gruvbox
        use({
            "ellisonleao/gruvbox.nvim",
            requires = { "rktjmp/lush.nvim" },
        })
        -- zephyr
        -- use("glepnir/zephyr-nvim")
        -- nord
        use("shaunsingh/nord.nvim")
        -- onedark
        use("ful1e5/onedark.nvim")
        -- nightfox
        use("EdenEast/nightfox.nvim")
        -------------------------------------------------------
        -- 侧边栏 nvim-tree --
        use({
            "kyazdani42/nvim-tree.lua", 
            requires = "kyazdani42/nvim-web-devicons",
        })
        -- -------------------
        -- bufferline
        use({
            "akinsho/bufferline.nvim",
            requires = { "kyazdani42/nvim-web-devicons", "moll/vim-bbye" },
        })
        -- lualine
        use({
            "nvim-lualine/lualine.nvim",
            requires = { "kyazdani42/nvim-web-devicons" },
        })
        use("arkav/lualine-lsp-progress")
        -- telescope
        use({
            "nvim-telescope/telescope.nvim",
            requires = { "nvim-lua/plenary.nvim" },
        })
        -- telescope extensions
        use("LinArcX/telescope-env.nvim")
        use("nvim-telescope/telescope-ui-select.nvim")
        -- dashboard-nvim
        use("glepnir/dashboard-nvim")
        -- project
        use("ahmedkhalf/project.nvim")
        -- treesitter
        use({
            "nvim-treesitter/nvim-treesitter",
            run = ":TSUpdate",
        })
        -------------------- LSP --------------------
        use({ "williamboman/nvim-lsp-installer", commit = "36b44679f7cc73968dbb3b09246798a19f7c14e0" })
        -- Lspconfig
        use({ "neovim/nvim-lspconfig" })
        -- 补全引擎
        use("hrsh7th/nvim-cmp")
        -- Snippet 引擎
        use("hrsh7th/vim-vsnip")
        -- 补全源
        use("hrsh7th/cmp-vsnip")
        use("hrsh7th/cmp-nvim-lsp") -- { name = nvim_lsp }
        use("hrsh7th/cmp-buffer") -- { name = 'buffer' },
        use("hrsh7th/cmp-path") -- { name = 'path' }
        use("hrsh7th/cmp-cmdline") -- { name = 'cmdline' }
        use("hrsh7th/cmp-nvim-lsp-signature-help") -- { name = 'nvim_lsp_signature_help' }
        -- 常见编程语言代码段
        use("rafamadriz/friendly-snippets")
        -- UI 增强
        use("onsails/lspkind-nvim")
        use("tami5/lspsaga.nvim")
        -- 代码格式化
        use("mhartington/formatter.nvim")
        use({ "jose-elias-alvarez/null-ls.nvim", requires = "nvim-lua/plenary.nvim" })
        -- Lua 增强
        use("folke/lua-dev.nvim")
        -- JSON 增强
        use("b0o/schemastore.nvim")
    end,
    config = {
        -- 并发数限制
        max_jobs = 16,
        -- 自定义源
        git = {
        },
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

local packer = require("packer")

packer.startup({
  function(use)
    -- Packer 可以管理自己本身
    use 'wbthomason/packer.nvim'
    -- 插件列表
    -- -- 主题
    use 'folke/tokyonight.nvim'
    use 'mhartington/oceanic-next'
    use 'projekt0n/github-nvim-theme'
    use 'Mofiqul/vscode.nvim'

    use ({ "kyazdani42/nvim-tree.lua", requires = "kyazdani42/nvim-web-devicons" })

    -- 顶部标签页
    use({ "akinsho/bufferline.nvim", requires = { "kyazdani42/nvim-web-devicons", "moll/vim-bbye" }})

    --底部状态栏
    use({ "nvim-lualine/lualine.nvim", requires = { "kyazdani42/nvim-web-devicons" } })
    --use("arkav/lualine-lsp-progress")

    use { 'nvim-telescope/telescope.nvim', requires = { "nvim-lua/plenary.nvim" } }
    -- telescope extensions
    use "LinArcX/telescope-env.nvim"

    -- 启动页
    use("glepnir/dashboard-nvim")
    use("ahmedkhalf/project.nvim")

    --自动补齐括号
    use("jiangmiao/auto-pairs")

    -- 语法高亮
    use({ "nvim-treesitter/nvim-treesitter", run = ":TSUpdate" })

    -- 批量注释
    use("tpope/vim-commentary")

  --------------------- LSP --------------------
    --use({ "williamboman/nvim-lsp-installer", commit = "36b44679f7cc73968dbb3b09246798a19f7c14e0" })
    -- Lspconfig
    --use({ "neovim/nvim-lspconfig" })

    -- 自动补全
    -- 补全引擎
     --use("hrsh7th/nvim-cmp")
    -- snippet 引擎
    --use("hrsh7th/vim-vsnip")
    -- 补全源
    --use("hrsh7th/cmp-vsnip")
    --use("hrsh7th/cmp-nvim-lsp") -- { name = nvim_lsp }
    --use("hrsh7th/cmp-buffer") -- { name = 'buffer' },
    --use("hrsh7th/cmp-path") -- { name = 'path' }
    --use("hrsh7th/cmp-cmdline") -- { name = 'cmdline' }

    -- 常见编程语言代码段
    --use("rafamadriz/friendly-snippets")

    -- easymotion
    use("easymotion/vim-easymotion")

    use { 'neoclide/coc.nvim', branch = "release" }

    use("lukas-reineke/indent-blankline.nvim")
    use("mhartington/formatter.nvim")
    -- json 增强插件
    use("b0o/schemastore.nvim")
    --ts增强插件
    use({ "jose-elias-alvarez/nvim-lsp-ts-utils", requires = "nvim-lua/plenary.nvim" })
    use({ "jose-elias-alvarez/null-ls.nvim", requires = "nvim-lua/plenary.nvim" })
    use {'dsznajder/vscode-es7-javascript-react-snippets',
      run = 'yarn install --frozen-lockfile && yarn compile'
    }


end,

config = {
  display = {
    open_fn = function()
      return require("packer.util").float({border = "single"})
    end,
  }
}})

-- 保存后自动安装插件脚本

pcall(
  vim.cmd,
  [[
    augroup packer_user_config
    autocmd!
    autocmd BufWritePost plugins.lua source <afile> | PackerSync
    augroup end
  ]]
)


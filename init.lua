-- sudo dnf install nodejs yarnpkg cmake gcc g++ golang python3 python3=pip python3-neovim


-- 加载LazyNVim
local lazynvim_path = vim.fn.stdpath("data") .. "/plugin/lazy.nvim"
if not vim.loop.fs_stat(lazynvim_path) then
    vim.fn.system({
        "git",
        "clone",
        "--branch=stable",
        "https://github.com/folke/lazy.nvim.git",
        lazynvim_path,
    })
end
vim.opt.rtp:prepend(lazynvim_path)


-- 加载插件
require("lazy").setup({
    -- OneDark主题
    "joshdick/onedark.vim",
    -- 状态栏
    "vim-airline/vim-airline",
    -- Git 集成
    "tpope/vim-fugitive",
    -- 编辑历史
    "mbbill/undotree",
    -- Tag列表
    "preservim/tagbar",
    -- 符号闭合
    "jiangmiao/auto-pairs",
    -- 快速修改符号
    "tpope/vim-surround",
    -- 启动终端
    "akinsho/toggleterm.nvim",
    -- 直接开启终端并运行
    "kassio/neoterm",
    -- 窗口切换
    "t9md/vim-choosewin",
    -- 自动换行
    "reedes/vim-pencil",
    -- 剪贴板管理 TODO
    "tversteeg/registers.nvim",
    -- 自动缩进 TODO
    "godlygeek/tabular",
    -- 字符查找强化
    "rhysd/clever-f.vim",
    "easymotion/vim-easymotion",
    -- 快速注释 TODO
    "preservim/nerdcommenter",
    -- 快捷键提示
    "folke/which-key.nvim",
    -- UI库
    "MunifTanjim/nui.nvim",
    -- 通知
    "rcarriga/nvim-notify",
    "folke/noice.nvim",
    -- 文字对象强化
    "echasnovski/mini.ai",
    -- 文字范围
    "echasnovski/mini.indentscope",
    -- Fcitx模式自动切换
    "alohaia/fcitx.nvim",
    -- 专注模式
    "junegunn/goyo.vim",
    -- 代码观感强化
    { "nvim-treesitter/nvim-treesitter", build = ":TSUpdate" },
    -- 文件树
    "nvim-tree/nvim-tree.lua",
    "nvim-tree/nvim-web-devicons",
    -- 切换预设值 TODO
    "andrewradev/switch.vim",
    
    -- LSP 支持
    "neovim/nvim-lspconfig",
    -- LSP安装器
    { "williamboman/mason.nvim", build = ":MasonUpdate" },
    "williamboman/mason-lspconfig.nvim",
    "jose-elias-alvarez/null-ls.nvim",
    -- 基于LSP的代码段
    "L3MON4D3/LuaSnip",
    "onsails/lspkind-nvim",
    -- 预制的代码段
    "rafamadriz/friendly-snippets",
    -- 基于LSP的代码检查 TODO
    "dense-analysis/ale",
    -- 基于LSP的inlay hint
    "lvimuser/lsp-inlayhints.nvim",
    
    -- 代码补全支持
    "hrsh7th/nvim-cmp",
    -- 通过 Buffer 进行补全
    "hrsh7th/cmp-buffer",
    -- 通过路径进行补全
    "hrsh7th/cmp-path",
    -- 使用补全快速计算
    "hrsh7th/cmp-calc",
    -- 快速输入 Emoji
    "hrsh7th/cmp-emoji",
    -- 有词典的时候补全英文单词
    "octaltree/cmp-look",
    -- 基于LSP的补全
    "hrsh7th/cmp-nvim-lsp",
    -- 基于LSP的代码段补全
    "saadparwaiz1/cmp_luasnip",
    
    
    -- 搜索
    "nvim-lua/plenary.nvim",
    "nvim-telescope/telescope.nvim",
    -- 调试器整合
    "nvim-telescope/telescope-vimspector.nvim",
    -- 标题快速搜索
    "crispgm/telescope-heading.nvim",
    -- 文件浏览与搜索
    "nvim-telescope/telescope-file-browser.nvim",
    -- 环境变量搜索
    "LinArcX/telescope-env.nvim",
    -- FZF集成
    { "nvim-telescope/telescope-fzf-native.nvim", build = "cmake -S. -Bbuild -DCMAKE_BUILD_TYPE=Release && cmake --build build --config Release && cmake --install build --prefix build" },
    
    -- 代码调试 TODO
    "puremourning/vimspector",
    
    -- CMake命令
    "ilyachur/cmake4vim",
    -- Conda命令
    "cjrh/vim-conda",
    -- VirtualEnv命令
    "jmcantrell/vim-virtualenv",
    -- GLSL代码高亮
    "tikhomirov/vim-glsl",
    -- HLSL代码高亮
    "beyondmarc/hlsl.vim",
    -- Tex语言支持 TODO
    "lervag/vimtex",
    -- C++支持强化
    "octol/vim-cpp-enhanced-highlight",
    -- Markdown支持 TODO
    "plasticboy/vim-markdown",
    -- Markdown预览
    { "iamcco/markdown-preview.nvim", build = "cd app && yarn install" },
    -- 无浏览器的Markdown预览
    "ellisonleao/glow.nvim",
    -- Rust支持
    "rust-lang/rust.vim",
    -- Golang支持
    { "fatih/vim-go", build = ":GoUpdateBinaries" },
    -- Python支持
    "python-mode/python-mode",
    -- OrgMode支持
    'nvim-orgmode/orgmode',
})


-- 加载主题
vim.opt.termguicolors = true
vim.cmd.colorscheme("onedark")


-- 设置字体
vim.opt.guifont = "FiraCode Nerd Font Mono"


-- NeoVim个性化设置
-- 高亮
vim.cmd([[
    syntax enable
    filetype plugin indent on
]])
-- 行号
vim.wo.number = true
vim.wo.relativenumber = true
-- <leader>超时
vim.o.timeout = true
vim.o.timeoutlen = 300
-- 开启鼠标支持
vim.cmd("set mouse=a")
-- 设置Tab转4个空格
vim.cmd([[
    set tabstop=4
    set shiftwidth=4
    set expandtab
]])


-- 加载状态栏
vim.g["airline#extensions#tabline#enabled"] = true


-- 初始化剪贴板管理工具
require("registers").setup()


-- 初始化终端工具
require("toggleterm").setup()


-- 初始化快捷键提示
require("which-key").setup()


-- 初始化通知
require("noice").setup()

-- 初始化文字对象强化
require('mini.ai').setup()


-- 初始化文字范围
require('mini.indentscope').setup()


-- 初始化文件树
vim.g["loaded_netrw"] = 1
vim.g["loaded_netrwPlugin"] = 1
require("nvim-tree").setup()


-- 初始化OrgMode
require('orgmode').setup_ts_grammar()
require('orgmode').setup()


-- 初始化无浏览器Markdown预览
require("glow").setup()


-- 初始化Telescope
require("telescope").setup()
require("telescope").load_extension("vimspector")
require("telescope").load_extension("heading")
require("telescope").load_extension("file_browser")
require("telescope").load_extension("env")
require("telescope").load_extension("fzf")


-- 设置C++高亮强化
vim.g["cpp_class_scope_highlight"] = true
vim.g["cpp_member_variable_highlight"] = true
vim.g["cpp_class_decl_highlight"] = true
vim.g["cpp_posix_standard"] = true
vim.g["cpp_experimental_template_highlight"] = true
vim.g["cpp_concepts_highlight"] = true


-- 初始化LSP支持
require("mason").setup()
require("mason-lspconfig").setup({
    ensure_installed = {
        "clangd",
        "lua_ls",
        "bashls",
        "omnisharp",
        "grammarly",
        "remark_ls",
    }
})
local lspconfig = require("lspconfig")
-- lua_ls
lspconfig.lua_ls.setup({})
-- clangd
lspconfig.clangd.setup( {
    cmd = {
        "clangd",
        "--all-scopes-completion",
        "--completion-style=detailed",
        "--header-insertion=never",
    },
})
-- bashls
lspconfig.bashls.setup({})
-- omnisharp
lspconfig.omnisharp.setup({})
-- grammarly
lspconfig.grammarly.setup({})
-- remark_ls
lspconfig.remark_ls.setup({})

-- 初始化inlay hint
require("lsp-inlayhints").setup()
vim.api.nvim_create_augroup("LspAttach_inlayhints", {})
vim.api.nvim_create_autocmd("LspAttach", {
  group = "LspAttach_inlayhints",
  callback = function(args)
    if not (args.data and args.data.client_id) then
      return
    end

    local bufnr = args.buf
    local client = vim.lsp.get_client_by_id(args.data.client_id)
    require("lsp-inlayhints").on_attach(client, bufnr)
  end,
})

-- 初始化代码补全
local has_words_before = function()
	local line, col = unpack(vim.api.nvim_win_get_cursor(0))
	return col ~= 0 and vim.api.nvim_buf_get_lines(0, line - 1, line, true)[1]:sub(col, col):match("%s") == nil
end
local cmp = require("cmp")
local luasnip = require("luasnip")
cmp.setup({
    -- 代码段
    snippet = {
        expand = function(args)
            luasnip.lsp_expand(args.body)
        end,
    },
    -- 补全来源
    sources = {
        { name = 'nvim_lsp' },
        { name = 'luasnip' },
        { name = 'orgmode' },
        { name = "buffer" },
        { name = "calc" },
        { name = "path" },
        { name = "look", keyword_length=2, option={convert_case=true, loud=true}},
        { name = "emoji" },
    },
    -- 补全样式
    formatting = {
        format = require("lspkind").cmp_format {
            mode = 'symbol_text',
            preset = 'default',
            -- 来源显示
            menu = {
                buffer = '[buf]',
                nvim_lsp = '[lsp]',
                luasnip = '[snip]',
                calc = '[calc]',
                path = '[path]',
                look = '[look]',
                emoji = '[emo]'
            },
        },
    },
    -- 键位映射
    mapping = cmp.mapping.preset.insert ({
        -- Wiki：Super-Tab Config
        ['<Tab>'] = cmp.mapping(function(fallback)
            if cmp.visible() then
                cmp.select_next_item()
            elseif luasnip.expand_or_jumpable() then
                luasnip.expand_or_jump()
            elseif has_words_before() then
                cmp.complete()
            else
                fallback()
            end
        end, { 'i', 's' }),

        ['<S-Tab>'] = cmp.mapping(function(fallback)
            if cmp.visible() then
                cmp.select_prev_item()
            elseif luasnip.jumpable(-1) then
                luasnip.jump(-1)
            else
                fallback()
            end
        end, { 'i', 's' }),
        ['<C-Up>'] = cmp.mapping(cmp.mapping.scroll_docs(-4)),
        ['<C-Down>'] = cmp.mapping(cmp.mapping.scroll_docs(4)),
        ['<CR>'] = cmp.mapping.confirm({ select = true }),
    }),
    experimental = {
        -- 新版菜单
        native_menu = false,
		-- 虚影文字
        ghost_text = true,
    },
})
-- "/"的补全，用于单词搜索
cmp.setup.cmdline("/", {
    sources = {
        { name = "buffer" },
    },
})
-- ":"的补全，用于NVIM内置命令
cmp.setup.cmdline(":", {
    sources = {
            { name = "path" }
    },
})


-- 键位绑定，<leader>默认是"\"
-- 独立工具
require("which-key").register({
    s = {
            name = "独立命令",
            -- h=history
            h = { vim.cmd.UndotreeToggle, "编辑历史" },
            -- t=tag
            t = { vim.cmd.TagbarToggle, "Tag列表"},
            -- x = exec
            x = { vim.cmd.ToggleTerm, "终端" },
            -- v = vsplit
            v = { vim.cmd.vsplit, "竖向分屏" },
            -- c = split
            c = { vim.cmd.split, "横向分屏" },
            -- ge=goyo enable
            ge = { vim.cmd["Goyo"], "开启专注模式" },
            -- gd=goyo disable
            gd = { vim.cmd["Goyo!"], "关闭专注模式" },
            -- b = browser
            b = { vim.cmd.NvimTreeToggle, "文件树" },
        },
}, { prefix = "<leader>" })
-- choosewin
vim.keymap.set("n", "-", "<Plug>(choosewin)")
-- 窗口切换，Alt+方向键
vim.keymap.set("n", "<A-Up>", function() vim.cmd.wincmd("k") end)
vim.keymap.set("n", "<A-Down>", function() vim.cmd.wincmd("j") end)
vim.keymap.set("n", "<A-Left>", function() vim.cmd.wincmd("h") end)
vim.keymap.set("n", "<A-Right>", function() vim.cmd.wincmd("l") end)
-- Telescope
require("which-key").register({
    f = {
            name = "Telescope",
            -- ff=find files
            f = { function() vim.cmd.Telescope("find_files") end, "find_files" },
            -- fb=find file_browser
            b = { function() vim.cmd.Telescope("file_browser") end, "file_browser" },
            -- fc=find current
            c = { function() vim.cmd.Telescope("buffers") end, "buffers" },
            -- fe=find env
            e = { function() vim.cmd.Telescope("env") end, "env" },
            -- ft=find title
            t = { function() vim.cmd.Telescope("heading") end, "heading" },
            -- fh=find command_history
            h = { function() vim.cmd.Telescope("command_history") end, "command_history" },
            -- fg = find live_grep
            g = { function() vim.cmd.Telescope("live_grep") end, "live_grep" },
        },
}, { prefix = "<leader>" })


-- 自定义命令
-- 编辑CMakeLists.txt
vim.api.nvim_create_user_command("CMakeCreate", "new CMakeLists.txt", { nargs = 0 })
-- 编辑compile_flags.txt
vim.api.nvim_create_user_command("ClangCompileFlagCreate", "new compile_flags.txt", { nargs = 0 })
-- 导出CMake编译命令
vim.api.nvim_create_user_command("CMakeExport", ":T cmake -DCMAKE_EXPORT_COMPILE_COMMANDS=1 <args>", { nargs = "*" })
-- 清空剪贴板
vim.api.nvim_create_user_command("WipeReg", "for i in range(34,122) | silent! call setreg(nr2char(i), []) | endfor", { nargs = 0 })


-- 自动命令，与格式绑定
vim.api.nvim_create_autocmd({ "BufNewFile", "BufRead" }, {
    pattern = { "*.vs", "*.fs" },
    command = "set ft=glsl"
})


-- 自启动
vim.cmd("NvimTreeOpen")

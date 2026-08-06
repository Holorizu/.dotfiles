require("config.lazy")


--Vim Options
vim.o.number = true
vim.o.relativenumber = true
vim.o.tabstop = 4
vim.o.shiftwidth = 4
vim.o.smartindent = true
vim.o.undofile = true
vim.o.termguicolors = true
vim.o.cursorline = true
vim.opt.sessionoptions = 'curdir,folds,globals,help,tabpages,terminal,winsize'
--vim.api.nvim_set_hl(0, 'LineNrAbove', { fg='lightgreen' })
--vim.api.nvim_set_hl(0, 'LineNr', { fg='#ffffff', bold=true })
--vim.api.nvim_set_hl(0, 'CursorLineNr', { fg='#ffffff', bold=true })
--vim.api.nvim_set_hl(0, 'LineNrBelow', { fg='lightgreen',  })


-- Vim Remaps
vim.keymap.set('n', 'C-u', 'kzz', { desc = 'When Scrolling Up Keep Cursor at Middle'})
vim.keymap.set('n', 'C-d', 'jzz', { desc = 'When Scrolling Down Keep Cursor at Middle'})


--UndoTree keymaps
vim.keymap.set('n', '<leader>dt', vim.cmd.UndotreeToggle)


-- Telescope Keymaps
local builtin = require('telescope.builtin')
vim.keymap.set('n', '<leader>ff', builtin.find_files, { desc = 'Telescope find files' })
vim.keymap.set('n', '<leader>fg', builtin.live_grep, { desc = 'Telescope live grep' })
vim.keymap.set('n', '<leader>fb', builtin.buffers, { desc = 'Telescope buffers' })
vim.keymap.set('n', '<leader>fh', builtin.help_tags, { desc = 'Telescope help tags' })


-- LSP docs on hover
vim.keymap.set('n', 'K', vim.lsp.buf.hover, { desc = "Show docs on hover"})
vim.keymap.set('n', 'gd', vim.lsp.buf.definition, { desc = "Go to definition"})
vim.keymap.set('n', '<leader>ca', vim.lsp.buf.code_action, { desc = "Code actions"})


-- Neotree keymaps
vim.keymap.set('n', '<leader>e', ':Neotree toggle<CR>', {})


--Live Preview
vim.keymap.set('n', '<leader>lp', ':LivePreview start<CR>', {})
vim.keymap.set('n', '<leader>lc', ':LivePreview pick<CR>', {})
vim.keymap.set('n', '<leader>lm', ':LivePreview close<CR>', {})



-- Tabby Keymaps
vim.api.nvim_set_keymap("n", "<leader>ta", ":$tabnew<CR>", { noremap = true })
vim.api.nvim_set_keymap("n", "<leader>tc", ":tabclose<CR>", { noremap = true })
vim.api.nvim_set_keymap("n", "<leader>to", ":tabonly<CR>", { noremap = true })
vim.api.nvim_set_keymap("n", "<leader>tn", ":tabn<CR>", { noremap = true })
vim.api.nvim_set_keymap("n", "<leader>tp", ":tabp<CR>", { noremap = true })
-- move current tab to previous position
vim.api.nvim_set_keymap("n", "<leader>tmp", ":-tabmove<CR>", { noremap = true })
-- move current tab to next position
vim.api.nvim_set_keymap("n", "<leader>tmn", ":+tabmove<CR>", { noremap = true })



-- Colorscheme
vim.cmd("colorscheme cyberdream")


-- Configs/Setups incase i can't get the opts workaround to work(WILL HAPPEN) 

require('lualine').setup{
	options = { theme = 'ayu_dark'}
}



require('nvim-highlight-colors').setup()



require('livepreview.config').set()



require("luasnip.loaders.from_vscode").lazy_load()



require'cmp'.setup {
  sources = {
    { name = 'nvim_lsp' }
  }
}



require('livepreview.config').set({
	port = 5500,
	browser = 'default',
	dynamic_root = false,
	sync_scroll = true,
	picker = "",
	address = '127.0.0.1',
})


--- Lua
vim.o.autowriteall = true
vim.api.nvim_create_autocmd({ 'InsertLeavePre', 'TextChanged', 'TextChangedP' }, {
    pattern = '*', callback = function()
        vim.cmd('silent! write')
    end
})


--enable lsp
vim.lsp.enable('jdtls')
vim.lsp.enable('clangd')
vim.lsp.enable('lua_ls')
vim.lsp.enable('pyright')
vim.lsp.enable('html')
vim.lsp.enable('ts_ls')
vim.lsp.enable('cssls')

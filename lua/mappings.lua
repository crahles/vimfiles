-- Word Search
vim.keymap.set('n', '<leader>a', ':Ag<CR>')

-- File search
vim.keymap.set('n', '<leader>fb', ':Buffer<cr>')
vim.keymap.set('n', '<leader>ff', ':FZF<cr>')
vim.keymap.set('n', '<leader>fg', ':GFiles<cr>')
vim.keymap.set('n', '<c-o>', ':GFiles<cr>')
vim.keymap.set('n', '<leader>fw', ':Ag <c-r><c-w>')

-- Disable arrow keys
vim.keymap.set('n', '<Left>', ':echoe "Use h"<CR>')
vim.keymap.set('n', '<Right>', ':echoe "Use l"<CR>')
vim.keymap.set('n', '<Up>', ':echoe "Use k"<CR>')
vim.keymap.set('n', '<Down>', ':echoe "Use j"<CR>"')
vim.keymap.set('i', '<up>', '<nop>')
vim.keymap.set('i', '<down>', '<nop>')
vim.keymap.set('i', '<left>', '<nop>')
vim.keymap.set('i', '<right>', '<nop>')

vim.keymap.set("n", "<leader>rr", ":!rubocop %<CR>")
vim.keymap.set("n", "<leader>re", ":!rubocop -a %<CR>", {silent = true})
vim.keymap.set("n", "<leader>ra", ":!rubocop -A %<CR>", {silent = true})

-- Searching
vim.keymap.set('n', '<leader>h' ,':noh<CR>')
-- TODO this is not working
-- vim.keymap.set('n', '/', "/\v")
-- TODO how to use paste of current visualized word

-- Opens Rspec directly or VSplit
vim.keymap.set('n', '<C-A><C-A>', ':A<CR>')
vim.keymap.set('n', '<C-A><C-V>', ':AV<CR>')

-- Center screen when scrolling search results
vim.keymap.set('n', 'n', 'nzz')
vim.keymap.set('n', 'N', 'Nzz')

-- New Tab
vim.keymap.set('n', '<leader>t', ':tabnew<CR>')

-- Open Explor
vim.keymap.set('n', '<leader>e', ':Explore<CR>')
vim.keymap.set('n', ';', ':')

-- vim.keymap.set('t', '<Esc>', '<C-\><C-n>')

-- Use `lp` and `ln` for navigate diagnostics
vim.keymap.set('n', '<silent> <Leader>w', '<Plug>(coc-diagnostic-prev)')
vim.keymap.set('n', '<silent> <Leader>s', '<Plug>(coc-diagnostic-next)')

-- Coc Mappings
-- Remap keys for gotos
vim.keymap.set('n', 'gd', '<Plug>(coc-definition)', {silent = true})
vim.keymap.set('n', 'gr' ,'<Plug>(coc-references)', {silent = true})
vim.keymap.set('n', '<Leader>D', '<Plug>(coc-type-definition)', {silent = true})
vim.keymap.set("n", "gy", "<Plug>(coc-type-definition)", {silent = true})
vim.keymap.set('n', '<Leader>i', '<Plug>(coc-implementation)', {silent = true})
vim.keymap.set('n', 'gi', '<Plug>(coc-implementation)', {silent = true})
vim.keymap.set('n', '<Leader>q', '<Plug>(coc-codeaction)', {silent = true})
vim.keymap.set('i', '<c-space>', 'coc#refresh()', {silent = true})

-- key mapping for window navigation
vim.keymap.set('n', '<C-h>', '<C-w>h')
vim.keymap.set('n', '<C-j>', '<C-w>j')
vim.keymap.set('n', '<C-k>', '<C-w>k')
vim.keymap.set('n', '<C-l>', '<C-w>l')

-- Switch between buffers
vim.keymap.set('n', '<tab>', ':bn<CR>')
vim.keymap.set('n', '<S-tab>', ':bp<CR>')

-- Autocomplete
-- Having longer updatetime (default is 4000 ms = 4s) leads to noticeable
-- delays and poor user experience
vim.opt.updatetime = 300
local keyset = vim.keymap.set

function _G.check_back_space()
    local col = vim.fn.col('.') - 1
    return col == 0 or vim.fn.getline('.'):sub(col, col):match('%s') ~= nil
end

-- Use Tab for trigger completion with characters ahead and navigate NOTE:
-- There's always a completion item selected by default, you may want to enable
-- no select by setting `"suggest.noselect": true` in your configuration file
-- NOTE: Use command ':verbose imap <tab>' to make sure Tab is not mapped by
-- other plugins before putting this into your config
local opts = {
    silent = true, noremap = true, expr = true, replace_keycodes = false
}

vim.keymap.set("i", "<TAB>", 'coc#pum#visible() ? coc#pum#next(0) : v:lua.check_back_space() ? "<TAB>" : coc#refresh()', opts)
vim.keymap.set("i", "<S-TAB>", [[coc#pum#visible() ? coc#pum#prev(0) : "\<C-h>"]], opts)

vim.keymap.set("i", "<C-j>", 'coc#pum#visible() ? coc#pum#next(0) : v:lua.check_back_space() ? "<TAB>" : coc#refresh()', opts)
vim.keymap.set("i", "<C-k>", [[coc#pum#visible() ? coc#pum#prev(0) : "\<C-h>"]], opts)

-- Make <CR> to accept selected completion item or notify coc.nvim to format
-- <C-g>u breaks current undo, please make your own choice
vim.keymap.set("i", "<cr>", [[coc#pum#visible() ? coc#pum#confirm() : "\<C-g>u\<CR>\<c-r>=coc#on_enter()\<CR>"]], opts)

-- Use <c-space> to trigger completion
vim.keymap.set("i", "<c-space>", "coc#refresh()", {silent = true, expr = true})

-- Symbol renaming
vim.keymap.set("n", "<leader>rn", "<Plug>(coc-rename)", {silent = true})




-- TODO transfer to Lua
-- if has("autocmd")
--   au BufNewFile,BufRead *.go set filetype=go
--   au FileType go nmap <Leader>b <Plug>(go-build)
--   au FileType go nmap <Leader>gd <Plug>(go-doc)
--   au FileType go nmap <Leader>i <Plug>(go-info)
--   au FileType go nmap <Leader>r <Plug>(go-run)
--   " au FileType go nmap <Leader>t <Plug>(go-test)
--   au FileType go nmap gd <Plug>(go-def-tab)
--   au FileType go setl ts=4 sw=4 sts=4 noet

--   au BufNewFile,BufRead *.vue set filetype=vue
-- endif


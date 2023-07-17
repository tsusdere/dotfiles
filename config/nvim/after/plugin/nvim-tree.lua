vim.keymap.set('n', '<C-n', api.tree.toggle({ path ="<arg>"}))
vim.keymap.set('n', '<leader>nf', api.tree.find_file { open = true, update_root = <bang>})
vim.keymap.set('n', '<leader>r', api.tree.reload())

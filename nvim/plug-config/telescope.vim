" Using lua functions
nnoremap <leader>ff <cmd>lua require('telescope.builtin').find_files()<cr>
nnoremap <leader>fg <cmd>lua require('telescope.builtin').live_grep()<cr>
nnoremap <leader>fs <cmd>lua require('telescope.builtin').grep_string()<cr>
nnoremap <leader>fb <cmd>lua require('telescope.builtin').buffers()<cr>
nnoremap <leader>fh <cmd>lua require('telescope.builtin').help_tags()<cr>
nnoremap <leader>fv <cmd>lua require('telescope.builtin').treesitter()<cr>
nnoremap <leader>fn :lua require('telescope.builtin').live_grep{ find_command = {'rg', '--files', '--hidden', '-g', '!**/node_modules/**'} }<CR>
nnoremap <leader>fj :lua require('telescope.builtin').find_files{ find_command = {'rg', '--files', '--hidden', '-g', '!**/node_modules/**'} }<CR>

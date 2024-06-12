


vim.api.nvim_create_user_command('Markdown', ':! pandoc -o /tmp/md-temp.html -s -c $HOME/.config/nvim/md.css % && xdg-open /tmp/md-temp.html ', { nargs = 0 })
-- :command! -nargs=1 Upper echo toupper(<q-args>)
-- vim.api.nvim_create_user_command('Markdown', 'ls <q-args>', { nargs = 1 })

-- vim.cmd('Upper hello world') -- prints "HELLO WORLD"

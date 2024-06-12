


vim.api.nvim_create_user_command('Markdown', ':! pandoc -o /tmp/md-temp.html -s -c $HOME/.config/nvim/md.css % && xdg-open /tmp/md-temp.html ', { nargs = 0 })

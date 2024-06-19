-- some arbitrary commands for what might some day be an obsidian note-taking system (without obsidian)

vim.api.nvim_create_user_command('Markdown', ':! pandoc -o /tmp/md-temp.html -s -c $HOME/.config/nvim/md.css "%" && xdg-open /tmp/md-temp.html ', { nargs = 0 })

vim.api.nvim_create_user_command('MarkdownInPlace', ':! pandoc -o "%.html" -s -c $HOME/.config/nvim/md.css "%" && sed -i  \'s/.md"/.md.html"/g\' "%.html" && xdg-open "%.html" ', { nargs = 0 })

local command =  ':! pandoc -o "%.html" -s -c $HOME/.config/nvim/md.css "%" && sed -i  \'s/.md"/.md.html"/g\' "%.html" && xdg-open "%.html" ' 

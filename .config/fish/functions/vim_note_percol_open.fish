function vim_note_percol_open
	ls .vim/bundle/vim-notes/misc/notes/user/ | percol | read foo
	if [ $foo ]
		vim note:$foo
	else
		vim note:
	end
end

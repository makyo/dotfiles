" Run a given vim command on the results of fuzzy selecting from a given shell
" command. See usage below.
function! FzyCommand(choice_command, fzy_args, vim_command)
	try
		let selection = system(a:choice_command . " | fzy " .  a:fzy_args)
	catch /Vim:Interrupt/
		" Swallow the ^C so that the redraw below happens; otherwise there will be
		" leftovers from fzy on the screen
		redraw!
		return
	endtry
	redraw!
	exec a:vim_command . " " . selection
endfunction

function! FzyFile()
	call FzyCommand("find * -type f", "", ":e")
endfunction

function! FzyBuffer()
	let bufnrs = filter(range(1, bufnr("$")), 'buflisted(v:val)')
	let buffers = map(bufnrs, 'bufname(v:val)')
	call FzyCommand('echo "' . join(buffers, "\n") . '"', "", ":b")
endfunction

nnoremap <C-P> :call FzyFile()<CR>
nnoremap <Leader>fb :call FzyBuffer()<CR>

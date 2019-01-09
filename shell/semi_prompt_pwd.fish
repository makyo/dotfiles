switch (uname)
case Darwin
	function semi_prompt_pwd --description "Print the current working directory, shortened to fit the prompt"
		echo $PWD | sed -e "s|^$HOME|~|" -e 's|^/private||'
	end
case '*'
	function semi_prompt_pwd --description "Print the current working directory, shortened to fit the prompt"
		echo $PWD | sed -e "s|^$HOME|~|"
	end
end

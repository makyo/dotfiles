function fish_prompt --description 'Write out the prompt'
	
    set stat $status

# Just calculate these once, to save a few cycles when displaying the prompt
    if not set -q __fish_prompt_hostname
        set -g __fish_prompt_hostname (hostname|cut -d . -f 1)
    end

if not set -q __fish_prompt_normal
        set -g __fish_prompt_normal (set_color normal)
    end

if not set -q __fish_color_blue
        set -g __fish_color_blue (set_color -o blue)
    end

    if not set -q __fish_color_git_dirty
        set -g __fish_color_git_dirty (set_color -o 888)
    end

#Set the color for the status depending on the value
    set __fish_color_status (set_color -o green)
    if test $stat -gt 0
        set __fish_color_status (set_color -o red)
    end

    set indicator "↳ "
    set git_prompt (__fish_git_prompt)
    if test (echo $git_prompt | cut -c 2) = "("
        set indicator "➥ "
	if test (__fish_git_prompt_dirty | cut -c 1) = "*"
		set git_prompt "$__fish_color_git_dirty$git_prompt $__fish_prompt_normal"(__fish_git_prompt_informative_status)
	end
    end


switch $USER

case root

if not set -q __fish_prompt_cwd
            if set -q fish_color_cwd_root
                set -g __fish_prompt_cwd (set_color $fish_color_cwd_root)
            else
                set -g __fish_prompt_cwd (set_color $fish_color_cwd)
            end
        end

printf '%s@%s %s%s%s# ' $USER $__fish_prompt_hostname "$__fish_prompt_cwd" (prompt_pwd) "$__fish_prompt_normal"

case '*'

if not set -q __fish_prompt_cwd
            set -g __fish_prompt_cwd (set_color $fish_color_cwd)
        end

printf '\f\r[%s%s%s] %s%s@%s %s%s%s%s%s \f\r%s' "$__fish_color_status" (date "+%H:%M:%S") $__fish_prompt_normal "$__fish_color_blue" $USER $__fish_prompt_hostname "$__fish_prompt_cwd" (semi_prompt_pwd) "$__fish_prompt_normal" "$git_prompt" $__fish_prompt_normal $indicator

end
end


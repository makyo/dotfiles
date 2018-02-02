function fish_mode_prompt --description 'Displays the current mode'
  # Do nothing if not in vi mode
#  if test "$fish_key_bindings" = "fish_vi_key_bindings"
#  echo
#  switch $fish_bind_mode
#    case default
#    set_color --bold red 
#    echo -n -e '\n:'
#    case insert
#    set_color --bold green 
#    echo -n -e '\n\ni'
#    case replace-one
#    set_color --bold green 
#    echo -n -e '\nr'
#    case visual
#    set_color --bold magenta 
#    echo -n -e '\nv'
#  end
#  set_color normal
#  echo -n ' '
#  end
end

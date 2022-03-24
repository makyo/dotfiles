if status is-interactive > /dev/null
        set fish_key_bindings fish_vi_key_bindings
        set -x GOPATH "$HOME/work/go"
        set -x PATH $PATH ~/bin ~/.local/bin
        if test -d /usr/local/opt/python/libexec/bin
            set -x PATH /usr/local/opt/python/libexec/bin $PATH
        end
        if test -d $GOPATH/bin
                set -x PATH $PATH $GOPATH/bin
        end
        if test -d ~/.node_modules/bin
                set -x PATH $PATH ~/.node_modules/bin
        end
        if test -d /snap/bin
                set -x PATH $PATH /snap/bin
        end
        set -x GPG_TTY (tty)
        set -x EDITOR "/usr/bin/vim"
        set -x JUJU_REPOSITORY $HOME/work/charms
        set -x BROWSER (which firefox)
        set -x LAYER_PATH $JUJU_REPOSITORY/layers
        set -x INTERFACE_PATH $JUJU_REPOSITORY/interfaces
        set -x VIMWIKI_MARKDOWN_EXTENSIONS markdown_vimwiki,markdown_verse,markdown_editing,toc,wikilinks,extra,smarty,markdown_strikethrough
        set -l GPG_AGENT_INFO (gpg-agent -q --daemon 2>&1 | cut -d '=' -f 2 | cut -d ';' -f 1)
        source ~/.config/fish/functions/helpers.fish
        starship init fish | source
        if test -f /usr/bin/setxkbmap  # hacky
            setxkbmap -option compose:caps
        end
end

starship init fish | source
thefuck --alias | source

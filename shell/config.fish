if status is-interactive
        set fish_key_bindings fish_vi_key_bindings
        set -x GOPATH "$HOME/work/go"
        set -x PATH $PATH ~/bin
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
        set -x JUJU_REPOSITORY /home/makyo/work/charms
        set -x LAYER_PATH $JUJU_REPOSITORY/layers
        set -x INTERFACE_PATH $JUJU_REPOSITORY/interfaces
        set -x VIMWIKI_MARKDOWN_EXTENSIONS markdown_vimwiki,toc
        set -l GPG_AGENT_INFO (gpg-agent -q --daemon 2>&1 | cut -d '=' -f 2 | cut -d ';' -f 1)
        source ~/.config/fish/functions/fish_prompt.fish
        source ~/.config/fish/functions/helpers.fish
end

thefuck --alias | source

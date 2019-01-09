if status is-interactive
        set fish_key_bindings fish_vi_key_bindings
        set -x GOPATH "/home/makyo/work/go"
        set -x PATH $PATH $GOPATH/bin ~/bin ~/.node_modules/bin $FACTORPATH
        set -x GPG_TTY (tty)
        set -x EDITOR "/usr/bin/vim"
        set -x JUJU_REPOSITORY /home/makyo/work/charms
        set -x LAYER_PATH $JUJU_REPOSITORY/layers
        set -x INTERFACE_PATH $JUJU_REPOSITORY/interfaces
        set -l GPG_AGENT_INFO (gpg-agent -q --daemon 2>&1 | cut -d '=' -f 2 | cut -d ';' -f 1)
        source ~/.config/fish/functions/fish_prompt.fish
        source ~/.config/fish/functions/helpers.fish
end

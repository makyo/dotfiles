function pss
    ps -HFe|less
end

function fa
    fd -HL --no-ignore-vcs $argv
end

function zk
    vim -c VimwikiIndex
end

if command lsd --version > /dev/null 2>&1
    function ll
        lsd -l $argv
    end
    function ls
        lsd $argv
    end
end

function muck
    if test -z "$MUCK"
        echo "No MUCK set! Set MUCK env var first"
        false
    else
        if test -p ~/.local/share/stimmtausch/$MUCK/in
            echo $argv >> ~/.local/share/stimmtausch/$MUCK/in
            else
                echo "$MUCK infile not found!"
                false
            end
    end
end

function wmuck
    if test -z "$MUCK"
        echo "No MUCK set! Set MUCK env var first"
        false
    else
        if test -f ~/.local/share/stimmtausch/$MUCK/out
            if test "$argv" = "-m"
                tail -f ~/.local/share/stimmtausch/$MUCK/out | ag -i --nocolor "(makyo|maddy|you page|you whisper|in a page-pose to|to you\.)"
                    else
                        tail -f ~/.local/share/stimmtausch/$MUCK/out
                    end
            else
                echo "$MUCK infile not found!"
                false
            end
    end
end

function defmux
    tmux \
        new-session -s defmux \; \
        send-keys 'zk' C-m \; \
        split-window -h -p 25 \; \
        send-keys 'vit' C-m \; \
        split-window -p 33 \; \
        send-keys 'hledger-ui --theme=terminal -T' C-m
end

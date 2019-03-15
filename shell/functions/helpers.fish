function sshgw
        ssh -A madison@sshgw-sf.us.archive.org
end

function moshgw
        env LANG=en_US.utf-8 mosh madison@sshgw-sf.us.archive.org
end

function devbox
        ssh -A madison@wbgrp-svc110.us.archive.org
end

function mount-devbox
        umount -f ~/work/devbox-work
        sshfs madison@wbgrp-svc110.us.archive.org:/home/madison/work ~/work/devbox-work
end

function proxyhome
        #sshuttle -r madison@sshgw-sf.us.archive.org 0/0
        sshuttle -r madison@sshgw-sf.us.archive.org 207.241.224.0/20
end

function pss
        ps -HFe|less
end

function fa
        fd -HL --no-ignore-vcs $argv
end

if command lsd --version > /dev/null 2>&1
        function ll
                lsd -l $argv
        end
        function ls
                lsd $argv
        end
end

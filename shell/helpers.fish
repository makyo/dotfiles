function sshgw
        ssh -A madison@sshgw-sf.us.archive.org
end

function moshgw
        mosh madison@sshgw-sf.us.archive.org
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

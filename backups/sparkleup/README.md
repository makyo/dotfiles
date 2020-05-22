# SparkleUp

Unattended git syncing with cron.

SparkleUp is a simple set of scripts that can be scheduled with `cron`. When run, they `cd` to a specified git repo folder, pull, and then push. For reasons on why you might want to do that, see the use case below.

## Installing

Installing is as simple as cloning and running the init script

    git clone https://github.com/makyo/sparkleup.git
    cd sparkleup
    ./init
    
That will create a password-less keypair and instruct you on how to create projects.

## Use case

I found myself wanting a headless version of SparkleShare, and was stymied by the [lack thereof](https://github.com/hbons/SparkleShare/issues/1683). I wanted to keep some IRC and MUCK logs in a SparkleShare project, but I run my clients for those in a `tmux` session on a server. However, that server lives elsewhere, and has no X, so, alas, the usual SparkleShare clients were right out.

[Read more...](http://writing.drab-makyo.com/posts/tech/2019/01/09/sparkleup/)

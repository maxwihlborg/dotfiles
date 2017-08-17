# Colors
set normal (set_color normal)
set magenta (set_color magenta)
set yellow (set_color yellow)
set green (set_color green)
set red (set_color red)
set gray (set_color -o black)

# Path
set PATH /usr/local/sbin ~/.composer/vendor/bin ~/npm/bin $PATH

# Overrides
set fish_color_cwd yellow
set fish_greeting

# Fish git prompt
set __fish_git_prompt_show_informative_status 'yes'
set __fish_git_prompt_color_upstream_ahead green
set __fish_git_prompt_color_upstream_behind red
set __fish_git_prompt_color_cleanstate green
set __fish_git_prompt_color_branch yellow

# Functions
function la
    ls -a $argv
end

function ll
    ls -l $argv
end

function md
    mkdir -p $argv
end

function cdp
    cd $HOME/projects
end

function ..
    cd ../
end

function .2
    cd ../../
end

function .3
    cd ../../../
end

function mx
    env TERM=xterm-256color tmux $argv
end

function ne
    nvim $argv
end

# Prompt
function fish_prompt
    set -l last_status $status
    set -l normal (set_color normal)
    set -l color_cwd (set_color $fish_color_cwd)
    set -l color_wrapp (set_color blue)
    set -l suffix
    set -l prompt_status
    set -l path_cwd

    switch $USER
    case root toor
        set suffix "#"
    case '*'
        set suffix "\$"
    end

    if test $last_status -ne 0
        set prompt_status ' ' (set_color $fish_color_status) "[$last_status]" "$normal"
    end

    switch $PWD
    case $HOME
        set path_cwd '~'
    case '*'
        set path_cwd (basename $PWD)
    end

    echo -n -s $color_wrapp '[' $color_cwd $path_cwd $normal (__fish_vcs_prompt) $prompt_status $color_wrapp ']' $normal $suffix ' '
end


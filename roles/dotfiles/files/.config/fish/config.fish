# Colors
set normal (set_color normal)
set magenta (set_color magenta)
set yellow (set_color yellow)
set green (set_color green)
set red (set_color red)
set gray (set_color -o black)

# Paths
set PATH ~/bin /usr/local/sbin $HOME/.cargo/bin $HOME/.composer/vendor/bin (yarn global bin) $PATH
set -x GOPATH $HOME/gocode
set -x ANDROID_HOME $HOME/Library/Android/sdk
set -x XDG_CONFIG_HOME $HOME/.config

# Docker
# set -gx DOCKER_TLS_VERIFY "1";
# set -gx DOCKER_HOST "tcp://192.168.99.100:2376";
# set -gx DOCKER_CERT_PATH "/Users/maxwih/.docker/machine/machines/default";
# set -gx DOCKER_MACHINE_NAME "default";

# AutoJump
begin
  set --local AUTOJUMP_PATH /usr/local/share/autojump/autojump.fish
  if test -e $AUTOJUMP_PATH
    source $AUTOJUMP_PATH
  end
end

# Editor config
set -x EDITOR nvim
set -x VISUAL $EDITOR

# Environment variables
set -x LANG en_US.UTF-8
set -x LC_ALL en_US.UTF-8
set -x FZF_DEFAULT_COMMAND 'fd --type f'

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
function j
  z $argv
end

function la
  ls -a $argv
end

function ll
  ls -l $argv
end

function lla
  ls -la $argv
end

function md
  mkdir -p $argv
end

function cdp
  cd $HOME/projects
end

function cdd
  cd $HOME/dockerSites/www
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

function mux
  env TERM=xterm-256color tmuxinator $argv
end

function ne
  nvim.appimage  $argv
end

function vm
  vifm $argv
end

function banner
  figlet -f ~/.local/share/fonts/ansi.flf $argv | lolcat
end

function vlc
  /Applications/VLC.app/Contents/MacOS/VLC $argv
end

function whatsmyip
  curl ipinfo.io/ip
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


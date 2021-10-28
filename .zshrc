export EDITOR=nvim
export GO=/usr/local/go/bin
export PY=/usr/bin/python3
export PYENV_ROOT=$HOME/.pyenv
export GOPATH=$HOME/go
export RUBY=$HOME/.local/share/gem/ruby/3.0.0/bin
export NIMBLE=$HOME/.nimble/bin
export PYPY3=/opt/pypy3.7/bin
export CARGO=$HOME/.cargo/bin/cargo 
export POERTY=$HOME/.poetry/bin
export PATH=$HOME/bin:/usr/local/bin:$HOME/.local/bin:$CARGO:$NIMBLE:$GO:$GOPATH:$PY:$PYPY3:$POETRY:$RUBY:$PYENV_ROOT/bin:$PATH

# Path to your oh-my-zsh installation.
export ZSH="/home/ashwin/.oh-my-zsh"


plugins=(git python zsh-syntax-highlighting tmux)

ZSH_TMUX_AUTOSTART=true
ZSH_TMUX_UNICODE=true

source $ZSH/oh-my-zsh.sh

# User configuration

export MANPATH="/usr/local/man:$MANPATH"

# You may need to manually set your language environment
# export LANG=en_US.UTF-8
export LC_ALL=en_IN.UTF-8
export LANG=en_IN.UTF-8

# Preferred editor for local and remote sessions
if [[ -n $SSH_CONNECTION ]]; then
  export TERM=xterm-256color ssh # Alacritty sucks
fi

alias Dmusic=' yt-dlp -x --audio-format mp3 --add-metadata --xattrs --embed-thumbnail --prefer-ffmpeg  -o "%(title)s.%(ext)s"'
alias ls='exa --icons'

# pip zsh completion start
function _pip_completion {
  local words cword
  read -Ac words
  read -cn cword
  reply=( $( COMP_WORDS="$words[*]" \
             COMP_CWORD=$(( cword-1 )) \
             PIP_AUTO_COMPLETE=1 $words[1] 2>/dev/null ))
}
compctl -K _pip_completion pip
# pip zsh completion end
eval "$(starship init zsh)"


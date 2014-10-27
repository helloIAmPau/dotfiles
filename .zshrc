# Path to your oh-my-zsh configuration.
ZSH=$HOME/.oh-my-zsh


# Set name of the theme to load.
# Look in ~/.oh-my-zsh/themes/
# Optionally, if you set this to "random", it'll load a random theme each
# time that oh-my-zsh is loaded.
#ZSH_THEME=ys

# Example aliases
# alias zshconfig="mate ~/.zshrc"
# alias ohmyzsh="mate ~/.oh-my-zsh"

# Set to this to use case-sensitive completion
# CASE_SENSITIVE="true"

# Uncomment this to disable bi-weekly auto-update checks
# DISABLE_AUTO_UPDATE="true"

# Uncomment to change how often before auto-updates occur? (in days)
# export UPDATE_ZSH_DAYS=13

# Uncomment following line if you want to disable colors in ls
# DISABLE_LS_COLORS="true"

# Uncomment following line if you want to disable autosetting terminal title.
# DISABLE_AUTO_TITLE="true"

# Uncomment following line if you want to disable command autocorrection
# DISABLE_CORRECTION="true"

# Uncomment following line if you want red dots to be displayed while waiting for completion
COMPLETION_WAITING_DOTS="true"

# Uncomment following line if you want to disable marking untracked files under
# VCS as dirty. This makes repository status check for large repositories much,
# much faster.
# DISABLE_UNTRACKED_FILES_DIRTY="true"

# Which plugins would you like to load? (plugins can be found in ~/.oh-my-zsh/plugins/*)
# Custom plugins may be added to ~/.oh-my-zsh/custom/plugins/
# Example format: plugins=(rails git textmate ruby lighthouse)
plugins=(brew coffee encode64 gem gradle last-working-dir npm python pip osx redis-cli urltools vagrant web-search wd)

# Sourcing oh-my-zsh to enable configurations
source $ZSH/oh-my-zsh.sh

# Report CPU usage for commands running longer than 1 seconds
export REPORTTIME=1

# Show last exit code on right of prompt
export RPROMPT='%(?..:()'

# My current theme re-edited
local current_dir='${PWD/#$HOME/~}'
# Prompt format: \n # USER at MACHINE in DIRECTORY \n $ 
export PROMPT="
%{$terminfo[bold]$fg[blue]%}#%{$reset_color%} \
%{$fg[cyan]%}%n \
%{$fg[white]%}at \
%{$fg[green]%}$(hostname -s) \
%{$fg[white]%}in \
%{$terminfo[bold]$fg[yellow]%}${current_dir}%{$reset_color%}
%{$terminfo[bold]$fg[red]%}$ %{$reset_color%}"

# Customize to your needs...
export PATH=$PATH:/usr/bin:/bin:/usr/sbin:/sbin:/usr/local/bin

# DotFiles bin files
export PATH="$PATH/:$HOME/Develop/dotfiles/bin"

### Brew default editor
export EDITOR="vim"

### Adding aliases
[[ -s "$HOME/.aliases" ]] && . $HOME/.aliases

### Set locale motherfucker
export LC_ALL=en_US.UTF-8

# Specify your defaults in this environment variable
export HOMEBREW_CASK_OPTS="--appdir=/Applications"

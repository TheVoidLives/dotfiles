# Import paths and aliases
export ZPLUG_HOME=/usr/local/opt/zplug
source $ZPLUG_HOME/init.zsh

CONFIG=$ZPLUG_HOME/init.zsh
CONFIG_PATHS=$HOME/.config/zsh/paths.zsh
CONFIG_ALIAS=$HOME/.config/zsh/aliases.zsh


if [[ ! -a $CONFIG ]]; then
    echo "FATAL: Unable to load zplug!";
    echo -e "Expected location $CONFIG"
else 
    source $CONFIG
fi

### Wal
(cat ~/.cache/wal/sequences &)
wal -R

### Shell Utilities
zplug "plugins/history", from:oh-my-zsh
zplug "plugins/history-substring-search", from:oh-my-zsh

# TMUX
zplug "plugins/tmux", from:oh-my-zsh

# FileSystem 
zplug "plugins/ls", from:oh-my-zsh
zplug "plugins/wd", from:oh-my-zsh
zplug "plugins/fzf", from:oh-my-zsh, defer:1
# [ -f ~/.fzf.zsh ] && source ~/.fzf.zsh

# Git Plugins
zplug "plugins/git", from:oh-my-zsh, defer:1
zplug "plugins/github", from:oh-my-zsh

# Javscript Plugins
zplug "plugins/coffee", from:oh-my-zsh
zplug "plugins/nvm", from:oh-my-zsh

# Python Plugins
zplug "plugins/pip", from:oh-my-zsh
zplug "plugins/python", from:oh-my-zsh

# Ruby 
zplug "plugins/gem", from:oh-my-zsh

# Environment
# antigen bundle virtualenv
zplug "plugins/zsh-docker", from:oh-my-zsh

# DB 
# zplug "zpm-zsh/mysql-colorize"

# Note-taking
# zplug "chipsenkbeil/zsh-notes" 

# OS specific plugins
zplug "lib/clipboard", from:oh-my-zsh, if:"[[ $OSTYPE == *darwin* ]]"
zplug "plugins/brew", from:oh-my-zsh, if:"[[ $OSTYPE == *darwin* ]]"
zplug "zsh-users/zsh-apple-touchbar", if:"[[ $OSTYPE == *darwin* ]]" 

# Custome Aliases 
if [[ -a $CONFIG_ALIAS ]]; then 
    source $CONFIG_ALIAS
else
    echo "WARNING: Custom Aliases not found!"
fi

# Custome Path Extensions
if [[ -a $CONFIG_PATHS ]]; then
    source $CONFIG_PATHS
else 
    echo "WARNING: Custom Paths not found!"
fi

# zplug load --verbose
zplug load

# History Configuration
HISTSIZE=5000               #How many lines of history to keep in memory
HISTFILE=~/.zsh_history     #Where to save history to disk
SAVEHIST=10000              #Number of history entries to save to disk
HISTDUP=erase              #Erase duplicates in the history file
setopt    appendhistory     #Append history to the history file (no overwriting)
setopt    sharehistory      #Share history across terminals
setopt    incappendhistory  #Immediately append to the history file, not just when a term is killed

# zsh histroy subtring search
KEYTIMEOUT=1
bindkey -v

#if zplug check zsh-users/zsh-history-substring-search; then
 #   bindkey '^[[A' history-substring-search-up
  #  bindkey '^[[B' history-substring-search-down
#fi

bindkey "^[[A" history-beginning-search-backward
bindkey "^[[B" history-beginning-search-forward

# Handle NVM loading
# export NVM_DIR="$([ -z "${XDG_CONFIG_HOME-}" ] && printf %s "${HOME}/.nvm" || printf %s "${XDG_CONFIG_HOME}/nvm")"
# [ -s "$NVM_DIR/nvm.sh" ] && \. "$NVM_DIR/nvm.sh" # This loads nvm


# Use Starship Prompt
eval "$(starship init zsh)"

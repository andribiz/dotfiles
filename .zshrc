zmodload zsh/zprof 
# If you come from bash you might have to change your $PATH.
export PATH=$HOME/bin:/usr/local/bin:$PATH

# Path to your oh-my-zsh installation.
export ZSH="/Users/andrix/.oh-my-zsh"
#export JAVA_HOME="/Library/Java/JavaVirtualMachines/adoptopenjdk-8.jdk/Contents/Home/"
#export JDK_HOME="/Library/Java/JavaVirtualMachines/adoptopenjdk-8.jdk/Contents/Home/"

# FZF Config
export FZF_DEFAULT_COMMAND='fd --type f '
export FZF_DEFAULT_OPTS='--height 40% --layout=reverse --border'
export FZF_CTRL_T_COMMAND="$FZF_DEFAULT_COMMAND"
export FZF_CTRL_T_OPTS="--preview 'bat --color=always --line-range :50 {}'"
export FZF_ALT_C_COMMAND="$FZF_DEFAULT_COMMAND --type d"
export FZF_ALT_C_OPTS="--preview 'tree -C {} | head -50'"

export PYENV_ROOT="$HOME/.pyenv"
export JAVA_HOME=`/usr/libexec/java_home -v 1.11`
export JDK_HOME=`/usr/libexec/java_home -v 1.11`
export GOPATH=$HOME/sdk/go
export PATH="$PATH:/usr/local/opt/python@3.10/bin"
#export GOPATH=/Users/andrix/Documents/personal/code/fabric-14-airline/gocc
export GOROOT=/usr/local/opt/go/libexec
export PATH=$PATH:$GOPATH/bin
export PATH=$PATH:$GOROOT/bin
export PATH=$PATH:/usr/local/Cellar/libpq/12.1_1/bin
export PATH=$PATH:/Users/andrix/Library/Python/2.7/bin
export PATH=$PATH:$HOME/sdk/flutter/bin
export PATH=$PATH:/Users/andrix/Library/Python/3.9/bin
export PATH=$PATH:/Users/andrix/sdk/rust/cargo/bin
# export PATH=$PATH:/Users/andrix/sdk/rust/rustup/toolchains/stable-x86_64-apple-darwin/bin
export PATH=$PATH:/Users/andrix/sdk/hyperledger-fabric-1.4.7/bin
export PATH=$PATH:/Users/andrix/sdk/istio-1.10.2/bin
export PATH=$PATH:/Users/andrix/.pyenv/shim
#export PATH=$PATH:/Users/andrix/sdk/hyperledger-fabric-2.2/bin
export NODE_PATH=/Users/andrix/.nvm/versions/node/v12.16.3/lib/node_modules
export PATH="$PATH:/usr/local/opt/libpq/bin"
export CARGO_HOME=/Users/andrix/sdk/rust/cargo
export RUSTUP_HOME=/Users/andrix/sdk/rust/cargo

# Sementara di remove karena lambaattt.. 
# export NVM_DIR="$HOME/.nvm"
# [ -s "$NVM_DIR/nvm.sh" ] && \. "$NVM_DIR/nvm.sh"  # This loads nvm
# export PATH=$PATH:/Users/andrix/sdk/istio-1.8.1/bin
# PGO
export PATH=/Users/andrix/.pgo/pgo:$PATH
export PGOUSER=/Users/andrix/.pgo/pgo/pgouser
export PGO_CA_CERT=/Users/andrix/.pgo/pgo/client.crt
export PGO_CLIENT_CERT=/Users/andrix/.pgo/pgo/client.crt
export PGO_CLIENT_KEY=/Users/andrix/.pgo/pgo/client.key

# Autojump Config
[[ -s $(brew --prefix)/etc/profile.d/autojump.sh ]] && . $(brew --prefix)/etc/profile.d/autojump.sh


# Set name of the theme to load --- if set to "random", it will
# load a random theme each time oh-my-zsh is loaded, in which case,
# to know which specific one was loaded, run: echo $RANDOM_THEME
# See https://github.com/ohmyzsh/ohmyzsh/wiki/Themes
# ZSH_THEME="powerlevel9k/powerlevel9k"
ZSH_THEME="agnoster"

# Set list of themes to pick from when loading at random
# Setting this variable when ZSH_THEME=random will cause zsh to load
# a theme from this variable instead of looking in ~/.oh-my-zsh/themes/
# If set to an empty array, this variable will have no effect.
# ZSH_THEME_RANDOM_CANDIDATES=( "robbyrussell" "agnoster" )

# Uncomment the following line to use case-sensitive completion.
# CASE_SENSITIVE="true"

# Uncomment the following line to use hyphen-insensitive completion.
# Case-sensitive completion must be off. _ and - will be interchangeable.
# HYPHEN_INSENSITIVE="true"

# Uncomment the following line to disable bi-weekly auto-update checks.
# DISABLE_AUTO_UPDATE="true"

# Uncomment the following line to automatically update without prompting.
# DISABLE_UPDATE_PROMPT="true"

# Uncomment the following line to change how often to auto-update (in days).
# export UPDATE_ZSH_DAYS=13

# Uncomment the following line if pasting URLs and other text is messed up.
# DISABLE_MAGIC_FUNCTIONS=true

# Uncomment the following line to disable colors in ls.
# DISABLE_LS_COLORS="true"

# Uncomment the following line to disable auto-setting terminal title.
# DISABLE_AUTO_TITLE="true"

# Uncomment the following line to enable command auto-correction.
# ENABLE_CORRECTION="true"

# Uncomment the following line to display red dots whilst waiting for completion.
# COMPLETION_WAITING_DOTS="true"

# Uncomment the following line if you want to disable marking untracked files
# under VCS as dirty. This makes repository status check for large repositories
# much, much faster.
# DISABLE_UNTRACKED_FILES_DIRTY="true"

# Uncomment the following line if you want to change the command execution time
# stamp shown in the history command output.
# You can set one of the optional three formats:
# "mm/dd/yyyy"|"dd.mm.yyyy"|"yyyy-mm-dd"
# or set a custom format using the strftime function format specifications,
# see 'man strftime' for details.
# HIST_STAMPS="mm/dd/yyyy"

# Would you like to use another custom folder than $ZSH/custom?
# ZSH_CUSTOM=/path/to/new-custom-folder

# Which plugins would you like to load?
# Standard plugins can be found in ~/.oh-my-zsh/plugins/*
# Custom plugins may be added to ~/.oh-my-zsh/custom/plugins/
# Example format: plugins=(rails git textmate ruby lighthouse)
# Add wisely, as too many plugins slow down shell startup.
export NVM_LAZY_LOAD=true
export NVM_COMPLETION=true
plugins=(
  git 
  colored-man-pages 
  colorize 
  pip 
  python 
  brew 
  macos 
  zsh-syntax-highlighting 
  zsh-autosuggestions
  docker
  gcloud
  golang
  python
  rust
  kubectl
  fzf
  )


source $ZSH/oh-my-zsh.sh

# User configuration

# export MANPATH="/usr/local/man:$MANPATH"

# You may need to manually set your language environment
# export LANG=en_US.UTF-8

# Preferred editor for local and remote sessions
# if [[ -n $SSH_CONNECTION ]]; then
#   export EDITOR='vim'
# else
#   export EDITOR='mvim'
# fi

# Compilation flags
# export ARCHFLAGS="-arch x86_64"

# Set personal aliases, overriding those provided by oh-my-zsh libs,
# plugins, and themes. Aliases can be placed here, though oh-my-zsh
# users are encouraged to define aliases within the ZSH_CUSTOM folder.
# For a full list of active aliases, run `alias`.
#
# Example aliases
# alias zshconfig="mate ~/.zshrc"
# alias ohmyzsh="mate ~/.oh-my-zsh"

test -e "${HOME}/.iterm2_shell_integration.zsh" && source "${HOME}/.iterm2_shell_integration.zsh"

eval "$(starship init zsh)"


USE_GKE_GCLOUD_AUTH_PLUGIN=True

# My alias command 
alias v="/usr/local/bin/nvim"
alias lg="lazygit"
alias t="tmux"
alias tl="tmux list"
alias td="tmux detach"
alias ta="tmux attach -t $1"
alias gps="git push"
alias gpl="git pull"
alias ll="exa -l --group --icons"
alias lt="exa --tree --level=4 --icons"

# The next line updates PATH for the Google Cloud SDK.
if [ -f '/Users/andrix/sdk/google-cloud-sdk/path.zsh.inc' ]; then . '/Users/andrix/sdk/google-cloud-sdk/path.zsh.inc'; fi

# The next line enables shell command completion for gcloud.
if [ -f '/Users/andrix/sdk/google-cloud-sdk/completion.zsh.inc' ]; then . '/Users/andrix/sdk/google-cloud-sdk/completion.zsh.inc'; fi


# PyENV
export PYENV_ROOT="$HOME/.pyenv"
command -v pyenv >/dev/null || export PATH="$PYENV_ROOT/bin:$PATH"
eval "$(pyenv init -)"


# pgcli configuration
export PAGER="/usr/bin/less -S"
export EDITOR="neovim"

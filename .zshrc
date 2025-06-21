# If you come from bash you might have to change your $PATH.
# export PATH=$HOME/bin:/usr/local/bin:$PATH

# Path to your oh-my-zsh installation.
export ZSH="$HOME/.oh-my-zsh"

# Set name of the theme to load --- if set to "random", it will
# load a random theme each time oh-my-zsh is loaded, in which case,
# to know which specific one was loaded, run: echo $RANDOM_THEME
# See https://github.com/ohmyzsh/ohmyzsh/wiki/Themes
ZSH_THEME="agnoster"

# Set list of themes to pick from when loading at random
# Setting this variable when ZSH_THEME=random will cause zsh to load
# a theme from this variable instead of looking in $ZSH/themes/
# If set to an empty array, this variable will have no effect.
# ZSH_THEME_RANDOM_CANDIDATES=( "robbyrussell" "agnoster" )

# Uncomment the following line to use case-sensitive completion.
# CASE_SENSITIVE="true"

# Uncomment the following line to use hyphen-insensitive completion.
# Case-sensitive completion must be off. _ and - will be interchangeable.
# HYPHEN_INSENSITIVE="true"

# Uncomment one of the following lines to change the auto-update behavior
# zstyle ':omz:update' mode disabled  # disable automatic updates
# zstyle ':omz:update' mode auto      # update automatically without asking
# zstyle ':omz:update' mode reminder  # just remind me to update when it's time

# Uncomment the following line to change how often to auto-update (in days).
# zstyle ':omz:update' frequency 13

# Uncomment the following line if pasting URLs and other text is messed up.
# DISABLE_MAGIC_FUNCTIONS="true"

# Uncomment the following line to disable colors in ls.
# DISABLE_LS_COLORS="true"

# Uncomment the following line to disable auto-setting terminal title.
# DISABLE_AUTO_TITLE="true"

# Uncomment the following line to enable command auto-correction.
# ENABLE_CORRECTION="true"

# Uncomment the following line to display red dots whilst waiting for completion.
# You can also set it to another string to have that shown instead of the default red dots.
# e.g. COMPLETION_WAITING_DOTS="%F{yellow}waiting...%f"
# Caution: this setting can cause issues with multiline prompts in zsh < 5.7.1 (see #5765)
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
# Standard plugins can be found in $ZSH/plugins/
# Custom plugins may be added to $ZSH_CUSTOM/plugins/
# Example format: plugins=(rails git textmate ruby lighthouse)
# Add wisely, as too many plugins slow down shell startup.

plugins=(git docker zsh-autosuggestions zsh-syntax-highlighting)
source $ZSH/oh-my-zsh.sh
autoload -U compinit && compinit

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
alias r='. ranger'
alias open='wsl-open'
alias cop='clip.exe'

mcd() {
  mkdir $_
  cd $_
}

[ -f ~/.fzf.zsh ] && source ~/.fzf.zsh

export PATH="$PATH:/snap/bin"

eval "$(jump shell zsh)"
. "$HOME/.cargo/env"

source $HOME/.cargo/env

alias ju=just

# complete -F _just -o bashdefault -o default ju

alias e='nvim'
alias ls='lsd'
alias ll='lsd -l'

# Base16 Shell
BASE16_SHELL="$HOME/.config/base16-shell/"
[ -n "$PS1" ] &&
  [ -s "$BASE16_SHELL/profile_helper.sh" ] &&
  source "$BASE16_SHELL/profile_helper.sh"

base16_monokai
alias cat='bat'

export VISUAL=nvim
export EDITOR=nvim

export PATH="$HOME/.local/bin/:$PATH"

# network
alias myip="dig TXT +short o-o.myaddr.l.google.com @ns1.google.com | sed 's/\"//g'"


alias c='/mnt/c/Users/ibrah/AppData/Local/Programs/Microsoft\ VS\ Code/bin/code .'
alias random-nid="curl &>2 /dev/null https://staging.shahry.co:4433/api/v2/random-national-id/ --header 'Authorization:3E9AD1C7AF28975481BE28843783F' | jq '.national_id'  | sed 's/\"//g' | sed 's/\n//' "

function random-nid-batch() {
  timestamp=$(date +%s)
  output_file="random-nids-$1-$timestamp.txt"
  for i in $(seq 1 $1); do
    echo -ne "Generating NID $i of $1\r"
    random-nid >>$output_file
  done
}
alias g-hash-cop="git log --oneline | gum filter | cut -d' ' -f1 | cop"

function diff-branch() {
  git diff $(git merge-base $1 $2)..$2
}

export PATH=$PATH:/usr/local/go/bin
export RESEND_API_KEY=re_X1GvV3dR_FMNZU1k8Mk8Fnz89Tv31KKu9
alias random-password='openssl rand -base64'


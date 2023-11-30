# Fig pre block. Keep at the top of this file.
[[ -f "$HOME/.fig/shell/zshrc.pre.zsh" ]] && . "$HOME/.fig/shell/zshrc.pre.zsh"
# Enable Powerlevel10k instant prompt. Should stay close to the top of ~/.zshrc.
# Initialization code that may require console input (password prompts, [y/n]
# confirmations, etc.) must go above this block; everything else may go below.
if [[ -r "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh" ]]; then
  source "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh"
fi

# If you come from bash you might have to change your $PATH.
# export PATH=$HOME/bin:/usr/local/bin:$PATH

# Path to your oh-my-zsh installation.
export ZSH="$HOME/.oh-my-zsh"

# Set name of the theme to load --- if set to "random", it will
# load a random theme each time oh-my-zsh is loaded, in which case,
# to know which specific one was loaded, run: echo $RANDOM_THEME
# See https://github.com/ohmyzsh/ohmyzsh/wiki/Themes
#ZSH_THEME="robbyrussell"
#ZSH_THEME="random"
#ZSH_THEME="ys"

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

# Uncomment the following line to disable bi-weekly auto-update checks.
# DISABLE_AUTO_UPDATE="true"

# Uncomment the following line to automatically update without prompting.
# DISABLE_UPDATE_PROMPT="true"

# Uncomment the following line to change how often to auto-update (in days).
# export UPDATE_ZSH_DAYS=13

# Uncomment the following line if pasting URLs and other text is messed up.
# DISABLE_MAGIC_FUNCTIONS="true"

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
# Standard plugins can be found in $ZSH/plugins/
# Custom plugins may be added to $ZSH_CUSTOM/plugins/
# Example format: plugins=(rails git textmate ruby lighthouse)
# Add wisely, as too many plugins slow down shell startup.
# plugins=(git)

ZSH_DISABLE_COMPFIX=true
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

# zsh settings.
DISABLE_MAGIC_FUNCTIONS="true"
DISABLE_AUTO_UPDATE="true"

export ZPLUG_HOME="$HOME/.zplug"
if [[ ! -d "$ZPLUG_HOME" ]]; then
    git clone https://github.com/zplug/zplug $ZPLUG_HOME
    if [[ $? != 0 ]]; then
        function zplug() {
            return 1
        }
    fi
fi
if [[ -d "${ZPLUG_HOME}" ]]; then
    source "${ZPLUG_HOME}/init.zsh"
fi

# if got zsh compinit insure directories message, then you should run:
# sudo chown -R 755 /usr/local/share/zsh
# sudo chown -R $(whoami):staff /usr/local/share/zsh

# plugs
zplug 'zplug/zplug', hook-build:'zplug --self-manage'
zplug 'plugins/git', from:oh-my-zsh, if:'which git'
zplug 'agkozak/zsh-z'
zplug 'romkatv/powerlevel10k', use:powerlevel10k.zsh-theme
zplug 'Aloxaf/fzf-tab', defer:1
zplug 'zsh-users/zsh-autosuggestions', defer:2
zplug 'zsh-users/zsh-completions', defer:2
zplug 'zsh-users/zsh-history-substring-search'
zplug 'zsh-users/zsh-syntax-highlighting', defer:2
zplug 'joshskidmore/zsh-fzf-history-search', defer:2
zplug jonmosco/kube-ps1, defer:2

# sindresorhus/pure

if ! zplug check; then
    zplug install
fi
zplug load

# define and load own shell function in zsh.
if [[ -d "$HOME/.zsh.d" ]]; then
    fpath=(~/.zsh.d/ $fpath)
fi

export GO111MODULE=auto
export GOPROXY=https://goproxy.cn,direct
export GOROOT=/usr/local/opt/go/libexec
export GOPATH=$HOME/go
export PATH=$PATH:$GOROOT/bin:$GOPATH/bin
export PATH=$PATH:$HOME/.pub-cache/bin
export PATH=/usr/local/opt/ncurses/bin:$PATH
export LDFLAGS="-L/usr/local/opt/ncurses/lib"
export CPPFLAGS="-I/usr/local/opt/ncurses/include"

# lazyload to speedup terminal loading.
function nvm_enable () {
  export NVM_DIR="$HOME/.nvm"
    [ -s "/usr/local/opt/nvm/nvm.sh" ] && . "/usr/local/opt/nvm/nvm.sh"  # This loads nvm
    [ -s "/usr/local/opt/nvm/etc/bash_completion.d/nvm" ] && . "/usr/local/opt/nvm/etc/bash_completion.d/nvm"  # This loads nvm bash_completion
}

export PUB_HOSTED_URL=https://mirrors.tuna.tsinghua.edu.cn/dart-pub
export PATH="/usr/local/opt/imagemagick@7/bin:$PATH"
export LDFLAGS="-L/usr/local/opt/imagemagick@7/lib"
export CPPFLAGS="-I/usr/local/opt/imagemagick@7/include"
export PKG_CONFIG_PATH="/usr/local/opt/imagemagick@7/lib/pkgconfig"
export CGO_CFLAGS_ALLOW='-Xpreprocessor'
export PATH="/usr/local/opt/gnu-getopt/bin:$PATH"

# Open vscode from terminal
function code {
    if [[ $# = 0 ]]
    then
        open -a "Visual Studio Code"
    else
        local argPath="$1"
        [[ $1 = /* ]] && argPath="$1" || argPath="$PWD/${1#./}"
        open -a "Visual Studio Code" "$argPath"
    fi
}

function disableGoModule() {
    export GO111MODULE=off
}

function enableGoModule() {
    export GO111MODULE=auto
}

eval $(thefuck --alias)

[ -f "$HOME/.privaterc" ] && source "$HOME/.privaterc"
[ -f "$HOME/.aliases" ] && source "$HOME/.aliases"

export FZF_DEFAULT_COMMAND="fd --type f --hidden --follow --exclude '{.git,node_modules,__pycache__,.github}'"
export PATH="${PATH}:${HOME}/.krew/bin"
export ANSIBLE_CONFIG="${HOME}/.ansible/ansible.cfg"

export PATH="$(brew --prefix)/Cellar/openresty/1.19.9.1_2/nginx/sbin:$PATH"

# Proxy daemon
[[ $(ps -ef | grep polipo | grep -v "grep" | wc -l) -eq 0 ]] && proxyd

function xbin() {
  command="$1"
  args="${@:2}"
  if [ -t 0 ]; then
    curl -X POST "https://xbin.io/${command}" -H "X-Args: ${args}"
  else
    curl --data-binary @- "https://xbin.io/${command}" -H "X-Args: ${args}"
  fi
}

# kubernetes switch.
INSTALLATION_PATH=$(brew --prefix switch) && source $INSTALLATION_PATH/switch.sh

# Fig post block. Keep at the bottom of this file.
[[ -f "$HOME/.fig/shell/zshrc.post.zsh" ]] && . "$HOME/.fig/shell/zshrc.post.zsh"

source "$(brew --prefix)/opt/kube-ps1/share/kube-ps1.sh"
PROMPT='$(kube_ps1)'$PROMPT
#https://github.com/jonmosco/kube-ps1/issues/56
prompt_kube_ps1(){
   echo -n `kube_ps1`
}

### Fix slowness of pastes with zsh-syntax-highlighting.zsh
pasteinit() {
  OLD_SELF_INSERT=${${(s.:.)widgets[self-insert]}[2,3]}
  zle -N self-insert url-quote-magic # I wonder if you'd need `.url-quote-magic`?
}

pastefinish() {
  zle -N self-insert $OLD_SELF_INSERT
}
zstyle :bracketed-paste-magic paste-init pasteinit
zstyle :bracketed-paste-magic paste-finish pastefinish

#https://github.com/romkatv/powerlevel10k#why-some-prompt-segments-appear-and-disappear-as-im-typing
function kube-toggle() {
  if (( ${+POWERLEVEL9K_KUBECONTEXT_SHOW_ON_COMMAND} )); then
    unset POWERLEVEL9K_KUBECONTEXT_SHOW_ON_COMMAND
  else
    POWERLEVEL9K_KUBECONTEXT_SHOW_ON_COMMAND='kubectl|helm|kubens|kubectx|oc|istioctl|kogito|k9s|helmfile|flux|fluxctl|stern|kubeseal|skaffold|kubent'
  fi
  p10k reload
  if zle; then
    zle push-input
    zle accept-line
  fi
}
kube-toggle

export XDG_CONFIG_HOME=$HOME/.config

# Install navi widget.(Press ctrl+g to launch navi.)
eval "$(navi widget zsh)"

# To customize prompt, run `p10k configure` or edit ~/.p10k.zsh.
[[ ! -f ~/.p10k.zsh ]] || source ~/.p10k.zsh
source <(kubectl completion zsh)
source ~/.kubectl_fzf.plugin.zsh
source $HOME/.zsh_plugins/fzf.zsh

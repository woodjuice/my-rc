# Path to your oh-my-zsh installation.
export ZSH=$HOME/.oh-my-zsh
export ANDROID_HOME=/usr/local/opt/android-sdk
export ANDROID_NDK_HOME=/usr/local/Cellar/android-ndk/$versionexport 
export JAVA_HOME="/Library/Internet Plug-Ins/JavaAppletPlugin.plugin/Contents/Home" 
export PATH=${JAVA_HOME}/bin:$PATH


# Set name of the theme to load.
# Look in ~/.oh-my-zsh/themes/
# Optionally, if you set this to "random", it'll load a random theme each
# time that oh-my-zsh is loaded.
ZSH_THEME="ys"

# Uncomment the following line to use case-sensitive completion.
# CASE_SENSITIVE="true"

# Uncomment the following line to disable bi-weekly auto-update checks.
# DISABLE_AUTO_UPDATE="true"

# Uncomment the following line to change how often to auto-update (in days).
  export UPDATE_ZSH_DAYS=13

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
# The optional three formats: "mm/dd/yyyy"|"dd.mm.yyyy"|"yyyy-mm-dd"
 HIST_STAMPS="mm/dd/yyyy"

# Would you like to use another custom folder than $ZSH/custom?
#  ZSH_CUSTOM=/usr/local/bin/zsh                          

# Which plugins would you like to load? (plugins can be found in ~/.oh-my-zsh/plugins/*)
# Custom plugins may be added to ~/.oh-my-zsh/custom/plugins/
# Example format: plugins=(rails git textmate ruby lighthouse)
# Add wisely, as too many plugins slow down shell startup.


# User configuration

export PATH=$HOME/bin:/usr/local/bin:$PATH:/usr/local/sbin:$PATH
# export MANPATH="/usr/local/man:$MANPATH"
source $ZSH/oh-my-zsh.sh

# You may need to manually set your language environment
# export LANG=en_US.UTF-8

# Preferred editor for local and remote sessions
 if [[ -n $SSH_CONNECTION ]]; then
   export EDITOR='vim'
 else
   export EDITOR='mvim'
 fi

# Compilation flags
# export ARCHFLAGS="-arch x86_64"

# ssh
# export SSH_KEY_PATH="~/.ssh/dsa_id"

# Set personal aliases, overriding those provided by oh-my-zsh libs,
# plugins, and themes. Aliases can be placed here, though oh-my-zsh
# users are encouraged to define aliases within the ZSH_CUSTOM folder.
# For a full list of active aliases, run `alias`.
#
# Example aliases
 alias zshconfig="mvim ~/.zshrc"
 alias ohmyzsh="mvim ~/.oh-my-zsh"
 alias api='sudo apt-get install'
 alias vi='mvim'
 alias tree="find . -print | sed -e 's;[^/]*/;|____;g;s;____|; |;g'"
 alias szsh="source ~/.zshrc"
 alias vimconfig="mvim ~/.vimrc"




# zsh-completions 设置
fpath=(/usr/local/share/zsh-completions $fpath)

# alias别名转义设置
# alias在ZSH_CUSTOM文件夹里
# 要查看详细的 alias 则使用`alias`命令
#

#插件设置
plugins=(git autojump terminalapp gnu-utils ruby osx mvn gradle repo python)

#autojump 的设置
[[ -s $(brew --prefix)/etc/profile.d/autojump.sh ]] && . $(brew --prefix)/etc/profile.d/autojump.sh


# ssh设置
# export SSH_KEY_PATH="~/.ssh/dsa_id"


function gi() { curl -L -s https : // www.gitignore.io/api/$@ ;}
function gi() { curl -L -s https : // www.gitignore.io/api/$@ ;}

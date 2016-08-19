# Path to your oh-my-zsh installation.
export HOME=/home/tpatinya
export ZSH=/home/tpatinya/.oh-my-zsh

ulimit -c unlimited

#if [ -f /etc/bashrc ]; then
#	source /etc/bashrc
#fi

# Set name of the theme to load.
# Look in ~/.oh-my-zsh/themes/
# Optionally, if you set this to "random", it'll load a random theme each
# time that oh-my-zsh is loaded.
ZSH_THEME="jnrowe"
# Uncomment the following line to use case-sensitive completion.
# CASE_SENSITIVE="true"

# Uncomment the following line to use hyphen-insensitive completion. Case
# sensitive completion must be off. _ and - will be interchangeable.
# HYPHEN_INSENSITIVE="true"

# Uncomment the following line to disable bi-weekly auto-update checks.
# DISABLE_AUTO_UPDATE="true"

# Uncomment the following line to change how often to auto-update (in days).
# export UPDATE_ZSH_DAYS=13

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
 DISABLE_UNTRACKED_FILES_DIRTY="true"

# Uncomment the following line if you want to change the command execution time
# stamp shown in the history command output.
# The optional three formats: "mm/dd/yyyy"|"dd.mm.yyyy"|"yyyy-mm-dd"
# HIST_STAMPS="mm/dd/yyyy"

# Would you like to use another custom folder than $ZSH/custom?
# ZSH_CUSTOM=/path/to/new-custom-folder

# Which plugins would you like to load? (plugins can be found in ~/.oh-my-zsh/plugins/*)
# Custom plugins may be added to ~/.oh-my-zsh/custom/plugins/
# Example format: plugins=(rails git textmate ruby lighthouse)
# Add wisely, as too many plugins slow down shell startup.
plugins=(git)

# User configuration

# export MANPATH="/usr/local/man:$MANPATH"
source $ZSH/oh-my-zsh.sh
export DOTFILES=$HOME/.dotfiles
# You may need to manually set your language environment
# export LANG=en_US.UTF-8

# Preferred editor for local and remote sessions
# if [[ -n $SSH_CONNECTION ]]; then
#   export EDITOR='vim'
# else
#   export EDITOR='mvim'
# fi



export MPI_DIR=${HOME}/opt/mpi
export PATH=${MPI_DIR}/bin:${HOME}/opt/bin:${PATH}
export LD_LIBRARY_PATH=${MPI_DIR}/lib:${HOME}/opt/lib:${LD_LIBRARY_PATH}

SSH_ENV="$HOME/.ssh/environment"

function start_agent {
    echo "Initialising new SSH agent..."
    /usr/bin/ssh-agent | sed 's/^echo/#echo/' > "${SSH_ENV}"
    echo succeeded
    chmod 600 "${SSH_ENV}"
		    . "${SSH_ENV}" > /dev/null
    /usr/bin/ssh-add ~/.ssh/dancer;
}

if [ "$HOSTNAME" = dancer.icl.utk.edu ]; then

	# Source SSH settings, if applicable
	 if [ -f "${SSH_ENV}" ]; then
	     	. "${SSH_ENV}" > /dev/null
    	 	ps -ef | grep ${SSH_AGENT_PID} | grep ssh-agent$ > /dev/null || {
       		 	             start_agent;
   		 }
 	else
   	start_agent;
 	fi

fi

export TAG_ALIAS_FILE=${HOME}/opt/tagalias
export TAG_COMMAND=${HOME}/opt/bin/tag_exe
tag() { $TAG_COMMAND "$@"; source ${TAG_ALIAS_FILE} 2>/dev/null }
    alias ag=tag

[ -f ~/.fzf.zsh ] && source ~/.fzf.zsh

# vf - fuzzy open with vim from anywhere
# # ex: vf word1 word2 ... (even part of a file name)
# # zsh autoload function
vf() {
   local files

    files=(${(f)"$(locate -i -0 $@ | grep -z -vE '~$' | fzf --read0 -0 -1 -m)"})

    if [[ -n $files ]]
        then
             vim -- $files
             print -l $files[1]
    fi
}

fd() {
  local dir
  dir=$(find ${1:-.} -path '*/\.*' -prune \
                  -o -type d -print 2> /dev/null | fzf +m) &&
  cd "$dir"
}

v() {
  local file
  file=$(find ${1:-.} -path '*/\.*' -prune \
                  -o -type f -print 2> /dev/null | fzf +m) &&
  vim "$file"
}

dump() {
     ${1:-.} > /dev/null;
     ${1:-.}
}


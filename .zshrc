# Path to your oh-my-zsh installation.
  export ZSH=/home/apatinya/.oh-my-zsh
  export DOTFILES=$HOME/.dotfiles

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

  export PATH="/cm/shared/apps/gcc/4.5.4/bin:/home/apatinya/opt/ompi/bin:/cm/shared/apps/tmux/1.8/bin:/cm/shared/apps/git/2.7.0/bin:/cm/shared/apps/hub/v2.2.2/bin:/cm/shared/apps/go/1.5.2/go/bin:/cm/shared/apps/autotools/ac269-am1133-lt242/bin:/cm/shared/apps/valgrind/3.10.1/bin:/cm/shared/apps/subversion/1.7.9/bin:/cm/shared/apps/hwloc/1.11.2/bin:/cm/shared/apps/slurm/14.03.0/sbin:/cm/shared/apps/slurm/14.03.0/bin:/usr/lib64/qt-3.3/bin:/usr/local/bin:/bin:/usr/bin:/usr/local/sbin:/usr/sbin:/sbin:/sbin:/usr/sbin:/cm/local/apps/environment-modules/3.2.10/bin:/home/apatinya/bin"
# export MANPATH="/usr/local/man:$MANPATH"

source $ZSH/oh-my-zsh.sh

# You may need to manually set your language environment
# export LANG=en_US.UTF-8

# Preferred editor for local and remote sessions
# if [[ -n $SSH_CONNECTION ]]; then
#   export EDITOR='vim'
# else
#   export EDITOR='mvim'
# fi


export MPI_DIR=${HOME}/opt/mpi
export PATH=${MPI_DIR}/bin:${HOME}/opt/bin:${PATH}:/opt/intel/compilers_and_libraries_2016.3.210/linux/compiler/bin
export LD_LIBRARY_PATH=${MPI_DIR}/lib:${HOME}/opt/lib:/opt/intel/compilers_and_libraries_2016.3.210/linux/compiler/lib/intel64:${LD_LIBRARY_PATH}

export ACK_DIR=${HOME}/.dotfiles/ack-2.14-single-file
alias ack='perl $ACK_DIR'

SSH_ENV="$HOME/.ssh/environment"

function start_agent {
    echo "Initialising new SSH agent..."
    /usr/bin/ssh-agent | sed 's/^echo/#echo/' > "${SSH_ENV}"
    echo succeeded
    chmod 600 "${SSH_ENV}"
		    . "${SSH_ENV}" > /dev/null
    /usr/bin/ssh-add ~/.ssh/savbu-usnic;
}


# Config for savbu

if [ "$HOSTNAME" = savbu-usnic-a ]; then

	# Source SSH settings, if applicable
	 if [ -f "${SSH_ENV}" ]; then
	     	. "${SSH_ENV}" > /dev/null
    	 	ps -ef | grep ${SSH_AGENT_PID} | grep ssh-agent$ > /dev/null || {
       		 	             start_agent;
   		 }
 	else
   	start_agent;
 	fi

	# Load modules
	module load cisco/gnuplot/4.6.4
	module load slurm
	module load cisco/vim/7.4.1147
	module load cisco/ag
#	module load cisco/intel-compilers/2016-16.0.3.210
	export PATH=/auto/vic/bin:${PATH}
fi
module load cisco/gcc/5.3.0
module load cisco/gdb
module load cisco/intel-compilers

fd() {
	  local dir
	    dir=$(find ${1:-*} -path '*/\.*' -prune \
		                      -o -type d -print 2> /dev/null | fzf +m) &&
				        cd "$dir"
}

export TAG_ALIAS_FILE=/home/apatinya/opt/tagalias

if (( $+commands[tag] )); then
  tag() { command tag "$@"; source ${TAG_ALIAS_FILE:-/tmp/tag_aliases} 2>/dev/null }
    alias ag=tag
fi

[ -f ~/.fzf.zsh ] && source ~/.fzf.zsh

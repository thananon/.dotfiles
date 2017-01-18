# .bashrc

# Source global definitions
if [ -f /etc/bashrc ]; then
	. /etc/bashrc
fi

# User specific aliases and functions

export ACK_DIR=${HOME}/_personal/ack-2.14-single-file

alias ack='perl $ACK_DIR'

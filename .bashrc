# .bashrc

# Source global definitions
if [ -f /etc/bashrc ]; then
	. /etc/bashrc
fi

# User specific aliases and functions

export MPI_PATH=/home/apatinya/opt/ompi
export PATH=${MPI_PATH}/bin:${PATH}
export LD_LIBRARY_PATH=${MPI_PATH}/lib:${LD_LIBRARY_PATH}

export ACK_DIR=${HOME}/_personal/ack-2.14-single-file

alias ack='perl $ACK_DIR'

module load cisco/gcc/4.5.4
module load slurm 


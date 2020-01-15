[ -f $HOME/install/bin/zsh ] && exec $HOME/install/bin/zsh -l

BASH_RUNTIME=${HOME}/.bash_runtime
source ${BASH_RUNTIME}/basic_bashrc.sh
source ${BASH_RUNTIME}/g17_config.sh
source ${BASH_RUNTIME}/g17_bashrc.sh


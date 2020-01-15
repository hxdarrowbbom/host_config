export PATH="$HOME/install/bin:$PATH"
export LD_LIBRARY_PATH="$HOME/install/lib:$LD_LIBRARY_PATH"
export LD_RUN_PATH="$HOME/install/lib:$LD_RUN_PATH"

alias ll="ls -l -a"
alias grep="grep --color -n"

loadsrc()
{
	# 这个引号必须加不然有问题
	if [ -f "${HOME}/.zshrc" ]; then
		source ${HOME}/.zshrc
	else
		source ${HOME}/.bashrc
	fi
}

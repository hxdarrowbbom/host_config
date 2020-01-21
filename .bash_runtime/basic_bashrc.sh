export LANGUAGE=en_US.UTF-8
export LC_ALL=en_US.UTF-8

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

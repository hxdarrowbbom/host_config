export LANGUAGE=en_US.UTF-8
export LC_ALL=en_US.UTF-8

alias ll="ls -l -a"
alias grep="grep --color -n"

function loadsrc()
{
	# 这个引号必须加不然有问题
	if [ -f "${HOME}/.zshrc" ]; then
		source ${HOME}/.zshrc
	else
		source ${HOME}/.bashrc
	fi
}

function greppwd()
{

	if [ $# -lt 1 ]; then
        echo "usage: greppwd keyword"
        return 1
    fi
	# 注意不会搜索文件名
    /bin/grep -n -R "$1" . | /bin/grep -E -v '\.git|\.svn|\.asm|\.map|./tags:|^Binary file' | /bin/grep --color=auto "$1"
    return 0
}

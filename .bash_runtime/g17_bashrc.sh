# ~/.bashrc: executed by bash(1) for non-login shells.
# see /usr/share/doc/bash/examples/startup-files (in the package bash-doc)
# for examples

# 前往工作目录
function cdw()
{
	# 1 服务器logic缩写, 默认前往g17
	cd "$HOME/g17/${short_dir_map[${1-'tl'}]}"
}

# nc执行代码
function ncw()
{
	# 1 服务器logic缩写
	# 2 lua_trunk
	echo ls ${2} | nc -q 1 localhost ${short_port_map[${1}]}
	echo -e "\n"
}

# 结束掉所有的g17进程
alias gstop="sh $HOME/g17/trunk/shell/killg17main.sh"

# svn 记住格式自己来搞把
# alias svnadd="svn st | grep ? | awk '{print \$2}' | xargs svn add"
# alias svnrevert="svn st | grep M | awk '{print \$2}' | xargs svn revert"
# alias svnrmnoversion="svn st | grep ? | awk '{print \$2}' | xargs rm"

function svnlog()
{
	# 1 要查询的子文件或文件夹，必须从Info的URL开始算
	# 2 limit
	url=$(svn info | grep URL | head -n 1 | awk "{print \$2}")
	svn log ${url}/${1} -l ${2-"10"}
}

# svnlog 查找附带后3前1行
function svngreplog()
{
	# 1 要查询的子文件或文件夹，必须从Info的URL开始算
	# 2 limit
	# 3 要查询的目标
	url=$(svn info | grep URL | head -n 1 | awk "{print \$2}")
	svn log ${url}/${1} -l ${2-"10"} | grep ${3} -B 3 -A 1
}

# 删除pyc
alias rmpyc="find . -name \"*.pyc\" | xargs rm"

# QXZL
# g17qxzl="$HOME/g17/qxzl_trunk/logic/cmd/qcwiz/shell/g17qxzl.py"
# qxzl_center="$HOME/g17/qxzl_center"
# qxzl_trunk="$HOME/g17/qxzl_trunk"
# qxzl_remote="$HOME/g17/qxzl_remote"
# function g17qxzl()
# {
# 	${g17qxzl} qxzl ${qxzl_center} ${qxzl_trunk} ${qxzl_remote}
# }

# 不使用了
# alias ctl="find \"$logic_dir\" -path \"$logic_dir/autocode*\" -o -path \"$logic_dir/autocode_t*\" -o -path \"$logic_dir/common/autocode*\" -o -path \"$logic_dir/common/autocode_t*\" -o -path \"$logic_dir/char/npc*\" -o -path \"$logic_dir/common/npc*\" -o -path \"$logic_dir/maps*\" -o -path \"$logic_dir/common/map_config*\"  -o -path \"$logic_dir/fight/skills*\" -o -path \"$logic_dir/test*\" -a -prune -o -name \"*.lua\" -print | xargs ctags"
# alias ctl="find . -name \"*.lua\" -print | xargs ctags"
alias cte="find . -name \".cpp\" -print | xargs ctags"
alias fla="find . -name \"*.lua\"| xargs grep --color -n"
alias fc="find . -name \"*.c\" -or -name \"*.h\" -or -name \"*.cpp\" -or -name \"*.hpp\" |xargs grep --color -n"

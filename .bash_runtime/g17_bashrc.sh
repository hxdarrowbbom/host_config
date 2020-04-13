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
	if [ $# -lt 2 ]; then
		echo "usage: ncw 服务器logic缩写 lua_chunk"
		return -1
	fi
	echo ls ${2} | nc -q 1 localhost ${short_port_map[${1}]}
	echo -e "\n"
}

function greplgc()
{
	if [ $# -lt 2 ]; then
		echo "usage: grep tag keyword"
		return 1;
	fi

	VTAG=$1
	TARGET_DIR=$HOME/g17/${short_dir_map[${VTAG}]}
	find  ${TARGET_DIR}\
		-path ${TARGET_DIR}/common/autocode -prune \
		-o -path ${TARGET_DIR}/autocode -prune \
		-o -path ${TARGET_DIR}/autocode_t -prune \
		-o -path ${TARGET_DIR}/common/autocode_t -prune \
		-o -path ${TARGET_DIR}/dat -prune \
		-o -path ${TARGET_DIR}/db -prune \
		-o -path ${TARGET_DIR}/log -prune \
		-o -path ${TARGET_DIR}/xml -prune \
		-o -path ${TARGET_DIR}/test -prune \
		-o -type f -name "*.lua" -print | xargs /bin/grep --color=auto -n "$2"
}


# 结束掉所有的g17进程
alias gstop="sh $HOME/g17/trunk/shell/killg17main.sh"
# function gstop()
# {
# 	EPATH="$1"
# 	who=`whoami`
# 	for pid in `ps -eo pid,cmd -o ruser=useruser10 | grep $who | grep "g17main" |grep -v "grep"|awk -F " " '{print $1}'`
# 	do
# 		echo "start kill:" $pid
# 		if [ -e "/proc/$pid/exe" ]; then
# 			pwd_g17main=$EPATH"/g17main"
# 			exe_g17main=`ls -l /proc/$pid/exe | grep $pwd_g17main | grep -v "grep"`
# 			if [ "$exe_g17main" ]; then
# 				kill -9 $pid
# 				echo "find and kill g17main: " $pid
# 				continue
# 			fi
# 		fi
# 	done
# }


# svn 记住格式自己来搞把
# alias svnadd="svn st | grep ? | awk '{print \$2}' | xargs svn add"
# alias svnrmnoversion="svn st | grep ? | awk '{print \$2}' | xargs rm"

# svnlog 查找附带后3前1行
function svngreplog()
{
	# 1 要查询的子文件或文件夹，必须从Info的URL开始算
	# 2 grep的目标
	url=$(svn info | grep URL | head -n 1 | awk "{print \$2}")
	if [ $# -lt 1 ]; then
		echo "usage: svngreplog [file] target"
		return 1;
	fi

	if [ $# -eq 1 ]; then
		svn log ${url} -l ${3-"50"} | grep ${1} -B 1 -A 2
	fi

	if [ $# -eq 2 ]; then
		svn log ${url}/${1} -l ${3-"10"} | grep ${2} -B 1 -A 2
	fi
}

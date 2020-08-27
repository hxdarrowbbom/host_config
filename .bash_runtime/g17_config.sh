declare -A short_dir_map
short_dir_map=(
	["tl"]="trunk/logic" ["te"]="trunk/engine" ["t"]="trunk"
	["bl"]="beta/logic" ["be"]="beta/engine" ["b"]="beta"
	["t2l"]="trunk2/logic" ["t2e"]="trunk2/engine" ["t2"]="trunk2"
	["ttl"]="trunk_time/logic" ["tte"]="trunk_time/engine" ["tt"]="trunk_time"
	["ll"]="learn/logic" ["le"]="learn/engine" ["l"]="learn"
	["cl"]="center/logic" ["ce"]="center/engine" ["c"]="center"
	["rl"]="remote/logic" ["re"]="remote/engine" ["r"]="remote"
	# ["jl"]="jnh2020/logic" ["je"]="jnh2020/engine" ["j"]="jnh2020"
	# ["nl"]="new_user/logic" ["ne"]="new_user/engine" ["n"]="new_user"
	["gl"]="guoqing2020/logic" ["ge"]="guoqing2020/engine" ["g"]="guoqing2020"
	["el"]="test/logic" ["ee"]="test/engine" ["e"]="test"
	["hl"]="charge_guide/logic" ["he"]="charge_guide/engine" ["h"]="charge_guide"
)


declare -A short_port_map
short_port_map=(
	["t"]="6600" ["c"]="6610" ["r"]="6620" ["b"]="6630" ["l"]="6660" ["t2"]="6670" ["tt"]="6690"
	# ["j"]="6640" ["n"]="6650" 
	["e"]="6640" ["h"]="6650"
	["g"]="6680"
	
)

declare -A short_host_map
short_host_map=(
	["t"]="660" ["c"]="661" ["r"]="662" ["b"]="663" ["l"]="666" ["t2"]="667" ["tt"]="669"
	# ["j"]="664" ["n"]="665" 
	["e"]="664" ["h"]="665"
	["g"]="668"
)

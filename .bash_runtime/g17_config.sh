declare -A short_dir_map
short_dir_map=(
	["tl"]="trunk/logic" ["te"]="trunk/engine" ["t"]="trunk"
	["bl"]="beta/logic" ["be"]="beta/engine" ["b"]="beta"
	["b2l"]="beta2/logic" ["b2e"]="beta2/engine" ["b2"]="beta2"
	["ll"]="learn/logic" ["le"]="learn/engine" ["l"]="learn"
	["cl"]="center/logic" ["ce"]="center/engine" ["c"]="center"
	["rl"]="remote/logic" ["re"]="remote/engine" ["r"]="remote"
	["jl"]="jnh2020/logic" ["je"]="jnh2020/engine" ["j"]="jnh2020"
)


declare -A short_port_map
short_port_map=(
	["t"]="6600" ["c"]="6610" ["r"]="6620" ["b"]="6630" ["b2"]="6650"
	["j"]="6640"
	["l"]="6660"
)

declare -A short_host_map
short_host_map=(
	["t"]="660" ["c"]="661" ["r"]="662" ["b"]="663" ["b2"]="665"
	["j"]="664"
	["l"]="666"
)

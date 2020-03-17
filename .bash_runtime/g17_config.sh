declare -A short_dir_map
short_dir_map=(
	["tl"]="trunk/logic" ["te"]="trunk/engine"
	["bl"]="beta/logic" ["be"]="beta/engine"
	["ll"]="learn/logic" ["le"]="learn/engine"
	["ext"]="ext"
	["cl"]="center/logic" ["ce"]="center/engine"
	["rl"]="remote/logic" ["re"]="remote/engine"
	["qtl"]="qxzl_trunk/logic" ["qte"]="qxzl_trunk/engine"
	["bsl"]="bson_deep/logic" ["bse"]="bson_deep/engine"
)


declare -A short_port_map
short_port_map=(
	["tl"]="6600" ["cl"]="6610" ["rl"]="6620" ["bl"]="6630"
	["qtl"]="6640" 
	["bsl"]="6650"
	["ll"]="6660"
)

declare -A short_host_map
short_host_map=(
	["tl"]="660" ["cl"]="661" ["rl"]="662" ["bl"]="663"
	["qtl"]="664" 
	["bsl"]="665"
	["ll"]="666"
)

declare -A short_dir_map
short_dir_map=(
	["tl"]="trunk/logic" ["te"]="trunk/engine"
	["bl"]="beta/logic" ["be"]="beta/engine"
	["ex"]="ext"
	["cl"]="center/logic" ["ce"]="center/engine"
	["rl"]="remote/logic" ["re"]="remote/engine"
	["qtl"]="qxzl_trunk/logic" ["qte"]="qxzl_trunk/engine"
	["qcl"]="qxzl_center/logic" ["qce"]="qxzl_center/engine"
	["qrl"]="qxzl_remote/logic" ["qre"]="qxzl_remote/engine"
	["bsl"]="bson_deep/logic" ["bse"]="bson_deep/engine"
	["lsl"]="learn/logic" ["lse"]="learn/engine"
)


declare -A short_port_map
short_port_map=(
	["tl"]="6600" ["bl"]="6610" ["cl"]="6660" ["rl"]="6680"
	["qtl"]="6630" ["qrl"]="6620" ["qcl"]="6640"
	["bsl"]="6650"
	["lsl"]="6670"
)

declare -A short_host_map
short_host_map=(
	["tl"]="660" ["bl"]="661" ["cl"]="666" ["rl"]="668"
	["qtl"]="663" ["qrl"]="662" ["qcl"]="664"
	["bsl"]="665"
	["lsl"]="667"
)

" 热更
function UpLogicLua()
	:w!
	let Dir2Port = {
				\ "/trunk": 6600,
				\ "/center": 6610,
				\ "/remote": 6620,
				\ "/beta": 6630,
				\ "/qxzl_trunk": 6640,
				\ "/bson_deep": 6650,
				\ "/learn": 6660,
				\ }
	let FullPath = expand("%:p")
	let Logic = "logic"
	let End = stridx(FullPath, "/" . Logic)
	let BaseDir = "home/huangxing02/g17/"
	let PreLen = len(BaseDir)
	let Tag = strpart(FullPath, PreLen, End - PreLen)
	if !has_key(Dir2Port, Tag)	
		echo "can't find PORT: Dir" . Tag
		return
	endif

	let Prefix = BaseDir . Tag . "/" . Logic . "/"
	let RelaPath = strpart(FullPath, len(Prefix))
	let Port = Dir2Port[Tag]
	let Cmd = "!echo \"ls Update('" . RelaPath . "')\" | nc -q 1 localhost " . Port
	execute Cmd
endf

map <leader>u :call UpLogicLua()<cr>


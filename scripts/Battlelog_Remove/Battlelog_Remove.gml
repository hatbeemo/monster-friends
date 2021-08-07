///@arg text
function Battlelog_Remove(){
	var TEXT = argument[0]
	global._battle_log=string_replace_all(global._battle_log, TEXT, "")
	return true
}
///@arg ap
function Battle_SetAp() {
	var AP = argument[0]
	Flag_Set(FLAG_TYPE.STATIC,FLAG_STATIC.AP,AP);
	battle_ui.alarm[0]=10;
	return true;
}

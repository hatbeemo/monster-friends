///@arg ap
function Battle_SetSp() {
	var SP = argument[0]
	Flag_Set(FLAG_TYPE.STATIC,FLAG_STATIC.SP,SP);
	battle_ui.alarm[0]=10;
	return true;
}

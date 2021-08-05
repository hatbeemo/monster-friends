///@desc Board Resetting Start
var sp = Flag_Get(FLAG_TYPE.TEMP,FLAG_TEMP.ENEMY_SP,0)
if(sp>=6&&_did_special==false){
	Battle_SetMenuDialog("* Gospel is glowing with a strange&  power.")
}
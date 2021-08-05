///@arg damage
function Player_EarnDamageSp() {
	var DAMAGE=argument[0];
	var skip=false
	with(battle_enemy){
		if(_did_special>=1){
			skip=true
		}
	}
	if(!skip){
		var SP=Flag_Get(FLAG_TYPE.STATIC,FLAG_STATIC.SP);
		Flag_Set(FLAG_TYPE.STATIC,FLAG_STATIC.SP,SP+DAMAGE/2);
		SP=Flag_Get(FLAG_TYPE.TEMP,FLAG_TEMP.ENEMY_SP);
		Flag_Set(FLAG_TYPE.TEMP,FLAG_TEMP.ENEMY_SP,SP+DAMAGE/2);
		battle_ui.alarm[0]=10;
	}
}

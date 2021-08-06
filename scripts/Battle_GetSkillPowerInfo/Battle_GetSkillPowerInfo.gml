///@arg enemy_slot
function Battle_GetSkillPowerInfo() {
	var SKILL=argument[0];
	if(Battle_IsSkillValid(SKILL)){
		var INST=instance_create_depth(0,0,0,SKILL);
		if(Battle_GetMenuChoiceSkillPower()==0&&Battle_GetMenu()==BATTLE_MENU.SKILL_POWER){
			var INFO=INST.power_info_zero;
		}else{
			var INFO=INST.power_info;
		}
		instance_destroy(INST);
		return INFO;
	}else{
		return "";
	}
}

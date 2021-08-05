///@arg enemy_slot
function Battle_GetSkillInfo() {
	var SKILL=argument[0];
	if(Battle_IsSkillValid(SKILL)){
		var INST=instance_create_depth(0,0,0,SKILL);
		var NAME=INST.info;
		instance_destroy(INST);
		return NAME;
	}else{
		return "";
	}
}

///@arg enemy_slot
function Battle_GetSkillTarget() {
	var SKILL=argument[0];
	if(Battle_IsSkillValid(SKILL)){
		var INST=instance_create_depth(0,0,0,SKILL);
		var TARGET=INST.target;
		instance_destroy(INST);
		return TARGET;
	}else{
		return "";
	}
}

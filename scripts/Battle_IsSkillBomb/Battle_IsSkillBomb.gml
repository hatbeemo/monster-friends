///@arg enemy_slot
function Battle_IsSkillBomb() {
	var SKILL=argument[0];
	if(Battle_IsSkillValid(SKILL)){
		var INST=instance_create_depth(0,0,0,SKILL);
		var BOMB=INST.is_bomb;
		instance_destroy(INST);
		return BOMB;
	}else{
		return "";
	}
}

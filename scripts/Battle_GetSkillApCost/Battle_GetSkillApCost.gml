///@arg enemy_slot
function Battle_GetSkillApCost() {
	var SKILL=argument[0];
	if(Battle_IsSkillValid(SKILL)){
		var INST=instance_create_depth(0,0,0,SKILL);
		var NAME=INST.ap_cost;
		instance_destroy(INST);
		return NAME;
	}else{
		return "";
	}
}

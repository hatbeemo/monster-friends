///@arg enemy_slot
function Battle_IsSkillDealsDmg() {
	var SKILL=argument[0];
	if(Battle_IsSkillValid(SKILL)){
		var INST=instance_create_depth(0,0,0,SKILL);
		var DMGDEAL=INST.deals_dmg;
		instance_destroy(INST);
		return DMGDEAL;
	}else{
		return "";
	}
}

///@arg skill_obj/inst
function Battle_IsSkillValid() {
	var SKILL=argument[0];

	if(!object_exists(SKILL) && instance_exists(SKILL)){
		SKILL=SKILL.object_index;
	}

	if(object_exists(SKILL)){
		if(SKILL==battle_menu_skill || Object_GetBaseParent(SKILL)==battle_menu_skill){
			return true;
		}else{
			return false;
		}
	}


}

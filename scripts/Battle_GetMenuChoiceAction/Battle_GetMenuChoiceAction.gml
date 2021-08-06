function Battle_GetMenuChoiceAction() {
	if(Flag_Get(FLAG_TYPE.TEMP,FLAG_TEMP.WHIMSIE_PASSIVE_ACTIVE,0)==1){
		return battle._menu_choice_skill[2];
	}else{
		return battle._menu_choice_skill[Flag_Get(FLAG_TYPE.TEMP,FLAG_TEMP.MEMBER_ACTIVE,0)];
	}
	
	
}

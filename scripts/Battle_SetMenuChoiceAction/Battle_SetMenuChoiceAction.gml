///@arg action_choice
///@arg call_event*
function Battle_SetMenuChoiceAction() {
	var ACTION=argument[0];
	var CALL=true;
	if(argument_count>=2){
		CALL=argument[1];
	}

	if(ACTION>=0 && ACTION<=5){
		if(Flag_Get(FLAG_TYPE.TEMP,FLAG_TEMP.WHIMSIE_PASSIVE_ACTIVE,0)==1){
			battle._menu_choice_skill[2]=ACTION;
		}else{
			battle._menu_choice_skill[Flag_Get(FLAG_TYPE.TEMP,FLAG_TEMP.MEMBER_ACTIVE,0)]=ACTION;
		}
		
		if(CALL){
			Battle_CallEnemyEvent(BATTLE_ENEMY_EVENT.MENU_CHOICE_SWITCH);
		}
	
		return true;
	}else{
		return false;
	}


}

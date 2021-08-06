///@arg enemy_choice
///@arg call_event*
function Battle_SetMenuChoiceEnemy() {
	var ENEMY=argument[0];
	var CALL=true;
	if(argument_count>=2){
		CALL=argument[1];
	}
	var number=Battle_GetEnemyNumber()
	if(Battle_GetSkillTarget(ds_list_find_value(Flag_Get(FLAG_TYPE.STATIC,FLAG_STATIC.PARTY_MOVESETS+battle_ui.party_member[Flag_Get(FLAG_TYPE.TEMP,FLAG_TEMP.MEMBER_ACTIVE,0)]),Battle_GetMenuChoiceAction()))=="PLAYER"){
		number=2
	}
	if(_menu==BATTLE_MENU.CHECK_TARGET){
		if(instance_exists(battle_enemy_gospel)){
			number+=1;
		}
	}
	if(ENEMY>=0 && ENEMY<number){
		battle._menu_choice_enemy[Flag_Get(FLAG_TYPE.TEMP,FLAG_TEMP.MEMBER_ACTIVE,0)]=ENEMY;
	
		if(CALL){
			Battle_CallEnemyEvent(BATTLE_ENEMY_EVENT.MENU_CHOICE_SWITCH);
		}
	
		return true;
	}else{
		return false;
	}


}

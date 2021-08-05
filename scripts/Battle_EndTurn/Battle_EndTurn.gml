function Battle_EndTurn() {
	Battle_SetTurnNumber(Battle_GetTurnNumber()+1);
	/*var LAST=Battle_ConvertMenuChoiceEnemyToEnemySlot(Battle_GetMenuChoiceEnemy());
	var proc=0;
	repeat(3){
		if(proc!=LAST){
			Battle_CallEnemyEvent(BATTLE_ENEMY_EVENT.TURN_END,proc);
		}
		proc+=1;
	}*/
	Battle_CallEnemyEvent(BATTLE_ENEMY_EVENT.TURN_END);
	
	if(instance_exists(battle_attack)){
		with(battle_attack){
			event_user(BATTLE_TURN_EVENT.TURN_END);
		}
	}
	if(instance_exists(battle_menu_skill)){
		with(battle_menu_skill){
			instance_destroy();
		}
	}
	if(instance_exists(item)){
		with(item){
			instance_destroy();
		}
	}
	battle.turn_progress=0;
	battle._ailment_check=0;
	battle._ailment_target=0;
	Flag_Set(FLAG_TYPE.TEMP,FLAG_TEMP.GOSPEL_PASSIVE_BOOST,0)
	Flag_Set(FLAG_TYPE.TEMP,FLAG_TEMP.WHIMSIE_BOMB_FUSE,1)
	var proc=0;
	repeat(battle_ui.party_size){
		Battle_SetPartyBlock(0,battle_ui.party_member[proc])	
		proc+=1
	}
	Battle_GotoNextState();
	return true;
}

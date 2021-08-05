battle.turn_progress+=1;
if(battle.turn_progress<array_length(battle.battle_turn_order)){
	if(Player_GetPartyHp(battle.battle_turn_order[battle.turn_progress])<=0){
		battle.turn_progress+=1;
	}
}
instance_destroy();
if(battle.turn_progress>=array_length(battle.battle_turn_order)){
	if(Player_GetPartyHp(0)<=0){
		Flag_Set(FLAG_TYPE.TEMP,FLAG_TEMP.MEMBER_ACTIVE,1)
	}else{
		Flag_Set(FLAG_TYPE.TEMP,FLAG_TEMP.MEMBER_ACTIVE,0)
	}
	Battle_SetState(BATTLE_STATE.AILMENT_EFFECTS);
}else if(battle.battle_turn_order[battle.turn_progress]>=2){
	Battle_SetMenu(BATTLE_MENU.SKILL_EVENT_END);
	if(Player_GetPartyHp(0)<=0){
		Flag_Set(FLAG_TYPE.TEMP,FLAG_TEMP.MEMBER_ACTIVE,1)
	}else{
		Flag_Set(FLAG_TYPE.TEMP,FLAG_TEMP.MEMBER_ACTIVE,0)
	}
	if(instance_exists(battle_skill_bomb)){
		if(!instance_exists(text_typer)){
			with(battle_skill_bomb){
				if(fuse<=0){
					event_user(1)
				}
			}
		}
	}else{
		Battle_EndMenu()
	}
}else{
	Flag_Set(FLAG_TYPE.TEMP,FLAG_TEMP.MEMBER_ACTIVE,battle.battle_turn_order[battle.turn_progress])
	Battle_SetMenu(battle.turn_event[battle.battle_turn_order[battle.turn_progress]])
}
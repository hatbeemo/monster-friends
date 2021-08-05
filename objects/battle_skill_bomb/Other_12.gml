Battle_SetDialog("");
if(battle.turn_progress<array_length(battle.battle_turn_order)){
	if(battle.battle_turn_order[battle.turn_progress]>=2){
		Battle_EndMenu()
	}
}
instance_destroy();
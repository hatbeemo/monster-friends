if(!instance_exists(battle_damage)&&_done=1){
	if(instance_exists(battle_enemy_autoriel)&&Battle_GetEnemyName(Battle_ConvertMenuChoiceEnemyToEnemySlot(Battle_GetMenuChoiceEnemy()))=="AUTORIEL"){
		Battle_SetDialog("* The AUTORIEL gained {color_text `specred`}1 &  Vulnerable{color_text `white`}!{pause}{end}")
	}else{
		Battle_SetDialog("* "+Battle_GetEnemyName(Battle_ConvertMenuChoiceEnemyToEnemySlot(Battle_GetMenuChoiceEnemy()))+" gained {color_text `specred`}1 &  Vulnerable{color_text `white`}!{pause}{end}")
	}
	_done=2;
}
if(!instance_exists(text_typer)&&_done=2){
	if(instance_exists(battle_enemy_autoriel)&&Battle_GetEnemyName(Battle_ConvertMenuChoiceEnemyToEnemySlot(Battle_GetMenuChoiceEnemy()))=="AUTORIEL"){
		var proc=0;
		if(battle_enemy_autoriel.enemy_ailments!=-1){
			repeat(array_length(battle_enemy_autoriel.enemy_ailments)){
				if(battle_enemy_autoriel.enemy_ailments[proc]==13){
					audio_play_sound(snd_item_heal,0,false)
					Battle_SetDialog("* The AUTORIEL recovered {color_text `specaqua`}"+string(round(damage/2))+"{color_text `white`} AP&  with Kinetic Generator!{pause}{end}")
					_done=3;
				}
				proc+=1
			}
		}
		if(_done!=3){
			event_user(3)
		}
	}else{
		event_user(3)
	}
}
if(!instance_exists(text_typer)&&_done=0){
	if(_no_ap){
		event_user(3)
	}else{
		Battle_SetMenu(BATTLE_MENU.SKILL_DAMAGE);
		_done=1;
	}
}
if(!instance_exists(text_typer)&&_done=3){
	event_user(3)
}
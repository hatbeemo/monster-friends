if(!instance_exists(battle_damage)&&!instance_exists(text_typer)&&done=2){
	if(instance_exists(battle_enemy_autoriel)&&Battle_GetEnemyName(Battle_ConvertMenuChoiceEnemyToEnemySlot(Battle_GetMenuChoiceEnemy()))=="AUTORIEL"){
		var proc=0;
		if(battle_enemy_autoriel.enemy_ailments!=-1){
			repeat(array_length(battle_enemy_autoriel.enemy_ailments)){
				if(battle_enemy_autoriel.enemy_ailments[proc]==13){
					audio_play_sound(snd_item_heal,0,false)
					Battle_SetDialog("* The AUTORIEL recovered {color_text `specaqua`}"+string(round(damage/2))+"{color_text `white`} AP&  with Kinetic Generator!{pause}{end}")
					done=3
				}
				proc+=1
			}
		}
		if(done!=3){
			event_user(2)
		}
	}else{
		event_user(2)
	}
}
if(!instance_exists(text_typer)&&done=3){
	event_user(2)
}
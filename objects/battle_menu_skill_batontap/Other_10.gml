///@desc Anim
event_inherited();
audio_play_sound(snd_player_atk,0,false)
with(Battle_GetEnemy(Battle_ConvertMenuChoiceEnemyToEnemySlot(Battle_GetMenuChoiceEnemy()))){
	var proc=0;
	if(enemy_ailments!=-1){
		repeat(array_length(enemy_ailments)){
			if(enemy_ailments[proc]==1){
				Battle_SetMenuFightDamage(Battle_GetMenuFightDamage()+Battle_GetMenuFightDamage()/2);
			}
			proc+=1
		}
	}
}
Battle_SetDialog(text)

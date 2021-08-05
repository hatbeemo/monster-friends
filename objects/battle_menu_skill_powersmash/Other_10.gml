///@desc Anim
event_inherited();
if(Battle_GetAp()>=ap_cost)
{
	audio_play_sound(snd_player_atk,0,false)
	with(Battle_ConvertMenuChoiceEnemyToEnemySlot(Battle_GetMenuChoiceEnemy())){
		var proc=0;
		if(enemy_ailments!=-1){
			repeat(array_length(enemy_ailments)){
				if(enemy_ailments[proc]==1){
					Battle_SetMenuFightDamage(Battle_GetMenuFightDamage()+Battle_GetMenuFightDamage()/2);
					enemy_ailment_numbers[proc]-=1
					if(enemy_ailment_numbers[proc]<=0){
						array_delete(enemy_ailments,proc,1)
						array_push(enemy_ailments,-1)
						array_delete(enemy_ailment_numbers,proc,1)
						array_push(enemy_ailment_numbers,-1)
					}
				}
				proc+=1
			}
		}
	}
	Battle_SetAp(Battle_GetAp()-ap_cost)
	Battle_SetDialog(text)
}else{
	Battle_SetDialog("* Gospel had insufficient AP to use&  "+use_name+"{color_text `white`}!{pause}{end}")
	_no_ap=true;
	Battle_SetMenuFightDamage(0);
}
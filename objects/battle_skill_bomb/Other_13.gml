///@desc Destroy
audio_stop_sound(snd_spike_disable)
audio_play_sound(snd_spike_disable,0,false)
audio_stop_sound(snd_explosion)
audio_play_sound(snd_explosion,0,false)
if(type="DMG"){
	var dmg=1
	var proc=0;
	repeat(3){
		with(Battle_GetEnemy(Battle_ConvertMenuChoiceEnemyToEnemySlot(proc))){
			var proc2=0;
			enemy_damage_deal=dmg;
			if(enemy_ailments!=-1){
				repeat(array_length(enemy_ailments)){
					if(enemy_ailments[proc2]==1){
						enemy_damage_deal=ceil(dmg*1.5);
					}
					proc2+=1
				}
			}
			event_user(15)
		}
		proc+=1
	}
	Battle_SetMenu(BATTLE_MENU.SKILL_DAMAGE_EXTRA);
	Player_EarnDamageSp(dmg);
}else if(type="BLOCK"){
	audio_stop_sound(snd_vaporize)
	audio_play_sound(snd_vaporize,0,false)
	damage=1
	var proc=0
	repeat(battle_ui.party_size){
		Battle_SetPartyBlock(Battle_GetPartyBlock(battle_ui.party_member[proc])+damage,battle_ui.party_member[proc])
		battle_ui.new_hp_color[proc]=AQUA_COLOR;
		battle_ui.hp_color_timer[proc]=2;
		proc+=1
	}
	battle_ui.new_bar_color=AQUA_COLOR;
	battle_ui.bar_color_timer=1;
}
Camera_Shake(3,3,2,2);
with(battle_skill_bomb){
	index-=1	
}
done=3;
audio_stop_sound(snd_bombtick)
audio_stop_sound(snd_explosion)
audio_play_sound(snd_explosion,0,false)
if(type="DMG"){
	if(index==0){
		bomb_dmg=damage
		var bomb_num=1;
		with(battle_skill_bomb)
		{
			if(index!=0&&type="DMG"&&fuse==0){
				other.bomb_dmg+=damage
				bomb_num+=1
			}
		}
		var dmg=bomb_dmg
		var proc=0;
		repeat(3){
			with(Battle_GetEnemy(Battle_ConvertMenuChoiceEnemyToEnemySlot(proc))){
				var proc2=0;
				enemy_damage_deal=dmg;
				if(enemy_ailments!=-1){
					repeat(array_length(enemy_ailments)){
						if(enemy_ailments[proc2]==1){
							dmg=ceil(other.bomb_dmg*1.5)
							enemy_damage_deal=dmg
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
		Battle_SetDialog("");
		if(index==0){
			if(bomb_num==1){
				Battlelog_Add("The Black Bomb exploded!\nGospel takes "+string(dmg)+" damage!\n")
			}else{
				Battlelog_Add("The "+string(bomb_num)+" Black Bombs exploded!\nGospel takes "+string(dmg)+" damage!\n")
			}
		}
	}
	done=2;
}else if(type="BLOCK"){
	audio_stop_sound(snd_vaporize)
	audio_play_sound(snd_vaporize,0,false)
	if(index==0){
		var proc=0
		repeat(4){
			var inst=instance_create_depth(40+proc*160,y+random(40),DEPTH_BATTLE.BULLET_OUTSIDE_HIGH,battle_skill_bomb_smoke)
			inst.image_blend=AQUA_COLOR
			proc+=1
		}
		bomb_dmg=damage
		var bomb_num=1;
		with(battle_skill_bomb)
		{
			if(index!=0&&type="BLOCK"&&fuse==0){
				other.bomb_dmg+=damage
				bomb_num+=1
			}
		}
		damage=bomb_dmg
		var proc=0
		repeat(battle_ui.party_size){
			Battle_SetPartyBlock(Battle_GetPartyBlock(battle_ui.party_member[proc])+damage,battle_ui.party_member[proc])
			battle_ui.new_hp_color[proc]=AQUA_COLOR;
			battle_ui.hp_color_timer[proc]=2;
			proc+=1
		}
		battle_ui.new_bar_color=AQUA_COLOR;
		battle_ui.bar_color_timer=2;
		if(battle_ui.party_size==1){
			Battle_SetDialog("* "+Player_GetPartyName(battle_ui.party_member[0])+" was protected by the&  Smoke Bomb!&* "+Player_GetPartyName(battle_ui.party_member[0])+" gained {color_text `specaqua2`}"+string(damage)+" BLOCK{color_text `white`}!{pause}{end}");
			if(index==0){
				if(bomb_num==1){
					Battlelog_Add("The Smoke Bomb exploded!\nWhimsie was protected by the Smoke Bomb!\nWhimsie gained "+string(damage)+" BLOCK!\n")
				}else{
					Battlelog_Add("The "+string(bomb_num)+" Smoke Bombs exploded!\nWhimsie was protected by the Smoke Bomb!\nWhimsie gained "+string(damage)+" BLOCK!\n")
				}
			}
		}else{
			Battle_SetDialog("* Everyone was protected by the&  Smoke Bomb!&* Party gained {color_text `specaqua`}"+string(damage)+" BLOCK{color_text `white`}!{pause}{end}");
			if(index==0){
				if(bomb_num==1){
					Battlelog_Add("The Smoke Bomb exploded!\nEveryone was protected by the Smoke Bomb!\nParty gained "+string(damage)+" BLOCK!")
				}else{
					Battlelog_Add("The "+string(bomb_num)+" Smoke Bombs exploded!\nEveryone was protected by the Smoke Bomb!\nParty gained "+string(damage)+" BLOCK!")
				}
			}
		}
	}
	done=2;
}
Camera_Shake(6,6,2,2);
explode_timer=2;
explode_grow=1;
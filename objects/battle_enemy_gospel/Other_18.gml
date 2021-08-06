///@desc Turn Preparation Start
if(_hp<=0){
	room_goto(room_endscreen_win)
}else{
	//Prepare the attack
	var ap = Flag_Get(FLAG_TYPE.TEMP,FLAG_TEMP.ENEMY_AP,0)
	var sp = Flag_Get(FLAG_TYPE.TEMP,FLAG_TEMP.ENEMY_SP,0)
	audio_play_sound(snd_enemy_atk,0,false);
	var proc=0;
	var is_vulnerable=false;
	repeat(ds_list_size(Flag_Get(FLAG_TYPE.STATIC,FLAG_STATIC.PARTY_AILMENTS+battle_ui.party_member[0],0))){
		if(ds_list_find_value(Flag_Get(FLAG_TYPE.STATIC,FLAG_STATIC.PARTY_AILMENTS+battle_ui.party_member[0],0),proc)==1){
			is_vulnerable=true;
		}
		proc+=1
	}
	Battle_SetDialog("* (test){pause}{end}")
	if(is_vulnerable||powersmash_turns>0){
		if(ap<=1)
		{
			if(sp>=6&&Battle_GetTurnNumber()>=4&&_did_special==0){
				//Enough SP to fill AP bar! Use it!
				audio_stop_sound(snd_enemy_atk);
				audio_play_sound(snd_special_obtain,0,false);
				Battle_SetDialog("{face 30}{face_emotion 8}Must... power up...{pause}{end}")
				var atk = instance_create_depth(0,0,0,battle_attack_special_powersurge);
				atk.attack_priority=0;
				_did_special=2;
			}else{
				//Better power up.
				Battle_SetDialog("{face 30}{face_emotion 8}* Must... power up...{pause}{end}")
				var atk = instance_create_depth(0,0,0,battle_attack_recharge);
				atk.attack_priority=0;
				//check_move[2]=check_move[12]
				//check_desc[0]="* {color_text `gospel`}Gospel{color_text `white`} - Known SKILLs&* "+check_move[0]+" / "+check_move[1]+"&* "+check_move[2]
			}
		}else{
			//It's Power Smash time! Boost this attack depending on AP.
			var atk = instance_create_depth(0,0,0,battle_attack_powersmash);
			//check_move[1]=check_move[11]
			//check_desc[0]="* {color_text `gospel`}Gospel{color_text `white`} - Known SKILLs&* "+check_move[0]+" / "+check_move[1]+"&* "+check_move[2]
			atk.attack_priority=0;
			if(instance_exists(battle_skill_bomb)){
				var near_detonate = ceil(instance_number(battle_skill_bomb)/2)
				var dmg_bomb = 0
				with(battle_skill_bomb){
					if(type=="DMG"){
						dmg_bomb+=1	
					}
					if(type=="BLOCK"){
						dmg_bomb-=1	
					}
					if(fuse<=3){
						near_detonate+=0.5
					}
					if(fuse<=2){
						near_detonate+=1
					}
					if(fuse<=1){
						near_detonate+=1.5
					}
				}
				near_detonate=round(near_detonate)
				Battle_SetDialog("{face 30}{face_emotion 7}* Not so fast!{pause}{end}")
				if(near_detonate>=choose(3,4,5)){
					if(dmg_bomb>=1){
						atk.remove_bomb="DMG"
					}else if(dmg_bomb<=-1){
						atk.remove_bomb="BLOCK"
					}else{
						atk.remove_bomb=choose("DMG","BLOCK")
					}
				}else{
					Battle_SetDialog("{face 30}{face_emotion 7}* And... COMBO!{pause}{end}")
					if(powersmash_uses==0){
						atk.powerboost=1;
					}else{
						atk.powerboost=clamp(ap-1,0,3);
					}
					if(atk.powerboost>0){
						atk.name=atk.name+" +"+string(atk.powerboost)
					}
					powersmash_uses+=1
				}
			}else{
				Battle_SetDialog("{face 30}{face_emotion 7}* And... COMBO!{pause}{end}")
				if(powersmash_uses==0){
					atk.powerboost=1;
				}else{
					atk.powerboost=clamp(ap-1,0,3);
				}
				if(atk.powerboost>0){
					atk.name=atk.name+" +"+string(atk.powerboost)
				}
				powersmash_uses+=1
			}
			powersmash_turns-=1
		}
	}else{
		if(ap<=2)
		{
			if(sp>=6&&Battle_GetTurnNumber()>=4&&_did_special==0){
				//Enough SP to fill AP bar! Use it!
				audio_stop_sound(snd_enemy_atk);
				audio_play_sound(snd_special_obtain,0,false);
				Battle_SetDialog("{face 30}{face_emotion 8}* Must... power up...{pause}{end}")
				var atk = instance_create_depth(0,0,0,battle_attack_special_powersurge);
				atk.attack_priority=0;
				_did_special=2;
			}else{
				//Better power up.
				Battle_SetDialog("{face 30}{face_emotion 8}* Must... power up...{pause}{end}")
				var atk = instance_create_depth(0,0,0,battle_attack_recharge);
				atk.attack_priority=0;
				//check_move[2]=check_move[12]
				//check_desc[0]="* {color_text `gospel`}Gospel{color_text `white`} - Known SKILLs&* "+check_move[0]+" / "+check_move[1]+"&* "+check_move[2]
			}
		}else{
			//Use Iron Whip to make Whimsie Vulnerable. Don't boost this attack unless he has lots of AP
			//Also, use the weaker version for this battle
			var atk = instance_create_depth(0,0,0,battle_attack_ironwhip_weak);
			//check_move[0]=check_move[10]
			//check_desc[0]="* {color_text `gospel`}Gospel{color_text `white`} - Known SKILLs&* "+check_move[0]+" / "+check_move[1]+"&* "+check_move[2]
			atk.attack_priority=0;
			atk.powerboost=clamp(ap-5,0,3);
			if(atk.powerboost>0){
				atk.name=atk.name+" +"+string(atk.powerboost)
			}
			Battle_SetDialog("{face 30}{face_emotion 7}* Take... THIS!{pause}{end}")
			if(Battle_GetTurnNumber()>=10){
				//Keep him using Power Smash for a bit.
				powersmash_turns=2
			}
		}
	}
		/*
		if(Battle_GetTurnNumber()==0){
			event_user(15)
			Battle_SetDialog("{face 30}* Take... THIS!{pause}{end}")
			Battle_SetMenuDialog("* Gospel is waiting for your move.")
		}
		if(Battle_GetTurnNumber()==1){
			var atk = instance_create_depth(0,0,0,battle_attack_powersmash);
			atk.attack_priority=0;
			atk.powerboost=clamp(ap-1,0,2);
			atk.name=atk.name+" + "+string(atk.powerboost)
			Battle_SetDialog("{face 30}* And... COMBO!{pause}{end}")
			Battle_SetMenuDialog("{face 30}* Something tells me I'm&  going to ENJOY this&  fight, Quaint...")
		}
		if(Battle_GetTurnNumber()==2){
			var atk = instance_create_depth(0,0,0,battle_attack_recharge);
			atk.attack_priority=0;
			Battle_SetDialog("{face 30}{face_expression 3}* Must... power up...{pause}{end}")
			Battle_SetMenuDialog("* Gospel cackles at you.")
		}
		if(Battle_GetTurnNumber()==3){
			var atk = instance_create_depth(0,0,0,battle_attack_powersmash);
			atk.attack_priority=0;
			atk.powerboost=clamp(ap-1,0,3);
			atk.name=atk.name+" + "+string(atk.powerboost)
			Battle_SetDialog("{face 30}* ..!{pause}{end}")
			Battle_SetMenuDialog("* Gospel is getting deadly..!")
		}
		if(Battle_GetTurnNumber()==4){
			var atk = instance_create_depth(0,0,0,battle_attack_ironwhip);
			atk.attack_priority=0;
			atk.powerboost=1;
			atk.name=atk.name+" + "+string(atk.powerboost)
			if(!_did_special){
				Battle_SetDialog("{face 30}* Your expression...{sleep 20}&* Good to see it again!{pause}{end}")
			}else{
				Battle_SetDialog("{face 30}* Your expression...{sleep 20}&* Good to see it again!{pause}{end}")
			}
			Battle_SetMenuDialog("* Gospel's ready to end this.")
		}
		if(Battle_GetTurnNumber()==5){
			var atk = instance_create_depth(0,0,0,battle_attack_powersmash);
			atk.attack_priority=0;
			atk.powerboost=clamp(ap-1,0,3);
			atk.name=atk.name+" + "+string(atk.powerboost)
			Battle_SetDialog("{face 30}* (test){pause}{end}")
		}*/
}
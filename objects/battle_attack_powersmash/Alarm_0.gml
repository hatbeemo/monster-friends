event_inherited();
if(remove_bomb!=false){
	var proc=0
	var likely_bomb=-1
	repeat(instance_number(battle_skill_bomb)){
		with(battle_skill_bomb){
			if(type=other.remove_bomb){
				if(fuse<=1){
					likely_bomb = id
				}
				other.bombs_to_remove[proc] = id
			}
		}
		proc+=1
	}
	if(likely_bomb!=-1){
		with(likely_bomb){
			event_user(3)
		}
	}else{
		with(bombs_to_remove[irandom(proc-1)]){
			event_user(3)
		}
	}
	if(remove_bomb=="DMG"){
		text = "* Whimsie's {color_text `whimsie`}Black Bomb{color_text `white`} was&  destroyed!{pause}{end}"
	}else if(remove_bomb=="BLOCK"){
		var has_ailment=0;
		repeat(ds_list_size(Flag_Get(FLAG_TYPE.STATIC,FLAG_STATIC.PARTY_AILMENTS+battle_ui.party_member[0],0))){
			if(ds_list_find_value(Flag_Get(FLAG_TYPE.STATIC,FLAG_STATIC.PARTY_AILMENTS+battle_ui.party_member[0],0),proc)==14){
				ds_list_set(Flag_Get(FLAG_TYPE.STATIC,FLAG_STATIC.PARTY_AILMENTS_NUMBERS+battle_ui.party_member[0],0),proc,ds_list_find_value(Flag_Get(FLAG_TYPE.STATIC,FLAG_STATIC.PARTY_AILMENTS_NUMBERS+battle_ui.party_member[0],0),proc)+1)
				has_ailment=1
			}
			proc+=1
		}
		if(!has_ailment){
			ds_list_set(Flag_Get(FLAG_TYPE.STATIC,FLAG_STATIC.PARTY_AILMENTS+battle_ui.party_member[0],0),proc,14)
			ds_list_set(Flag_Get(FLAG_TYPE.STATIC,FLAG_STATIC.PARTY_AILMENTS_NUMBERS+battle_ui.party_member[0],0),proc,2)
		}
		text = "* Whimsie's {color_text `whimsie`}Smoke Bomb{color_text `white`} was&  destroyed!&* Whimsie gained {color_text `specaqua2`}1 BLOCK and 1 BLUR{color_text `white`}!{pause}{end}"
	}
}else{
	audio_play_sound(snd_hurt,0,false);
	var vulndamage=1
	var proc=0;
	repeat(ds_list_size(Flag_Get(FLAG_TYPE.STATIC,FLAG_STATIC.PARTY_AILMENTS+battle_ui.party_member[0],0))){
		if(ds_list_find_value(Flag_Get(FLAG_TYPE.STATIC,FLAG_STATIC.PARTY_AILMENTS+battle_ui.party_member[0],0),proc)==1){
			vulndamage = 1.5
		}
		proc+=1
	}
	Player_HurtParty(ceil((damage*2+powerboost)*vulndamage),target);
	Player_EarnDamageSp((damage*2+powerboost)*vulndamage);
	Camera_Shake(3,3,2,2);
	if(Battle_GetPartyBlock(target)>0){
		text = "* "+Flag_Get(FLAG_TYPE.STATIC,FLAG_STATIC.PARTY_NAME+target,"")+" blocked the damage!{pause}{end}"
	}else{
		text = "* "+Flag_Get(FLAG_TYPE.STATIC,FLAG_STATIC.PARTY_NAME+target,"")+" took {color_text `specred`}"+string(round((damage*2+powerboost)*vulndamage)-Battle_GetPartyBlock(target))+"{color_text `white`} damage!{pause}{end}"
	}
	if(Player_GetPartyHp(target)<=0){
		text="* "+Flag_Get(FLAG_TYPE.STATIC,FLAG_STATIC.PARTY_NAME+target,"")+" was unable to continue&  fighting!{pause}{end}"
	}
}
Battle_SetDialog(text);
if(attack_priority==1){
	Anim_Create(battle_ui,"incoming_y2",ANIM_TWEEN.SINE,ANIM_EASE.IN,battle_ui.incoming_y2,100,25,0)
}else{
	Anim_Create(battle_ui,"incoming_y",ANIM_TWEEN.SINE,ANIM_EASE.IN,battle_ui.incoming_y,100,25,0)
}
instance_destroy();
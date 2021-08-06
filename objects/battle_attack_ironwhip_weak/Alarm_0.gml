event_inherited();
if(remove_bomb!=false){
	var proc=0
	repeat(instance_number(battle_skill_bomb)){
		with(battle_skill_bomb){
			if(type=other.remove_bomb){
				other.bombs_to_remove[proc] = id
			}
		}
		proc+=1
	}
	with(bombs_to_remove[irandom(proc)]){
		event_user(3)
	}
	var bomb_type="Bepis Bomb"
	if(remove_bomb=="DMG"){
		bomb_type="Black Bomb"
	}else if(remove_bomb=="BLOCK"){
		bomb_type="Smoke Bomb"
	}
	text = "* The {color_text `whimsie`}"+bomb_type+"{color_text `white`} was destroyed!{pause}{end}"
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
	var proc=0;
	var has_ailment=0;
	repeat(ds_list_size(Flag_Get(FLAG_TYPE.STATIC,FLAG_STATIC.PARTY_AILMENTS+battle_ui.party_member[0],0))){
		if(ds_list_find_value(Flag_Get(FLAG_TYPE.STATIC,FLAG_STATIC.PARTY_AILMENTS+battle_ui.party_member[0],0),proc)==1){
			has_ailment=1
		}
		proc+=1
	}
	if(!has_ailment){
		ds_list_add(Flag_Get(FLAG_TYPE.STATIC,FLAG_STATIC.PARTY_AILMENTS+battle_ui.party_member[0],0),1)
		ds_list_add(Flag_Get(FLAG_TYPE.STATIC,FLAG_STATIC.PARTY_AILMENTS_NUMBERS+battle_ui.party_member[0],0),2)
	}
	var oldhp = Player_GetPartyHp(target)
	Player_HurtParty(ceil((damage+powerboost)*vulndamage),target);
	Player_EarnDamageSp((damage+powerboost)*vulndamage);
	Camera_Shake(3,3,2,2);
	if(Player_GetPartyHp(target)==oldhp){
		text = "* "+Flag_Get(FLAG_TYPE.STATIC,FLAG_STATIC.PARTY_NAME+target,"")+" blocked the damage!&"
	}else{
		text = "* "+Flag_Get(FLAG_TYPE.STATIC,FLAG_STATIC.PARTY_NAME+target,"")+" took {color_text `specred`}"+string(round((damage+powerboost)*vulndamage)-Battle_GetPartyBlock(target))+"{color_text `white`} damage!&"
	}
	text += "* "+Flag_Get(FLAG_TYPE.STATIC,FLAG_STATIC.PARTY_NAME+target,"")+" gained {color_text `specred`}1 Vulnerable{color_text `white`}!{pause}{end}"
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
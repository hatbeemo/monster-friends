event_inherited();
audio_play_sound(snd_hurt,0,false);
var vulndamage=0
var proc=0;
repeat(ds_list_size(Flag_Get(FLAG_TYPE.STATIC,FLAG_STATIC.PARTY_AILMENTS+battle_ui.party_member[0],0))){
	if(ds_list_find_value(Flag_Get(FLAG_TYPE.STATIC,FLAG_STATIC.PARTY_AILMENTS+battle_ui.party_member[0],0),proc)==1){
		vulndamage = damage+powerboost
		ds_list_set(Flag_Get(FLAG_TYPE.STATIC,FLAG_STATIC.PARTY_AILMENTS_NUMBERS+battle_ui.party_member[0],0),proc,ds_list_find_value(Flag_Get(FLAG_TYPE.STATIC,FLAG_STATIC.PARTY_AILMENTS_NUMBERS+battle_ui.party_member[0],0),proc)-1)
		if(ds_list_find_value(Flag_Get(FLAG_TYPE.STATIC,FLAG_STATIC.PARTY_AILMENTS_NUMBERS+battle_ui.party_member[0],0),proc)<=0){
			ds_list_clear(Flag_Get(FLAG_TYPE.STATIC,FLAG_STATIC.PARTY_AILMENTS+battle_ui.party_member[0],0))
			ds_list_clear(Flag_Get(FLAG_TYPE.STATIC,FLAG_STATIC.PARTY_AILMENTS_NUMBERS+battle_ui.party_member[0],0))
		}
		break;
	}
	proc+=1
}
Player_HurtParty(damage+powerboost*2+vulndamage,target);
Player_EarnDamageSp(damage+powerboost*2);
Camera_Shake(3,3,2,2);
text = "* "+Flag_Get(FLAG_TYPE.STATIC,FLAG_STATIC.PARTY_NAME+target,"")+" took {color_text `specred`}"+string(damage+powerboost*2+vulndamage)+"{color_text `white`} damage!{pause}{end}"
if(Player_GetPartyHp(target)<=0){
	text="* "+Flag_Get(FLAG_TYPE.STATIC,FLAG_STATIC.PARTY_NAME+target,"")+" was unable to continue&  fighting!{pause}{end}"
}
Battle_SetDialog(text);
if(attack_priority==1){
	Anim_Create(battle_ui,"incoming_y2",ANIM_TWEEN.SINE,ANIM_EASE.IN,battle_ui.incoming_y2,100,25,0)
}else{
	Anim_Create(battle_ui,"incoming_y",ANIM_TWEEN.SINE,ANIM_EASE.IN,battle_ui.incoming_y,100,25,0)
}
instance_destroy();
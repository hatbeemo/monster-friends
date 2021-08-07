event_inherited();
audio_play_sound(snd_hurt,0,false);
var vulndamage=0
var proc=0;
repeat(ds_list_size(Flag_Get(FLAG_TYPE.STATIC,FLAG_STATIC.PARTY_AILMENTS+battle_ui.party_member[0],0))){
	if(ds_list_find_value(Flag_Get(FLAG_TYPE.STATIC,FLAG_STATIC.PARTY_AILMENTS+battle_ui.party_member[0],0),proc)==1){
		vulndamage = round((damage+powerboost)/2)
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
	ds_list_add(Flag_Get(FLAG_TYPE.STATIC,FLAG_STATIC.PARTY_AILMENTS_NUMBERS+battle_ui.party_member[0],0),1)
}
Player_HurtParty(damage+powerboost+vulndamage,target);
Player_EarnDamageSp(damage+powerboost);
Camera_Shake(3,3,2,2);
if(Battle_GetPartyBlock(target)>0){
	text = "* "+Flag_Get(FLAG_TYPE.STATIC,FLAG_STATIC.PARTY_NAME+target,"")+" blocked the damage!&"
}else{
	text = "* "+Flag_Get(FLAG_TYPE.STATIC,FLAG_STATIC.PARTY_NAME+target,"")+" took {color_text `specred`}"+string(damage+powerboost+vulndamage)+"{color_text `white`} damage!&"
}
text += "* "+Flag_Get(FLAG_TYPE.STATIC,FLAG_STATIC.PARTY_NAME+target,"")+" gained {color_text `specred`}1 Vulnerable{color_text `white`}!{pause}{end}"
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
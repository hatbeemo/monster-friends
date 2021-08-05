event_inherited();
audio_play_sound(snd_hurt,0,false);
Player_HurtParty(damage,target);
Player_EarnDamageSp(damage);
Camera_Shake(3,3,2,2);
text = "* "+Flag_Get(FLAG_TYPE.STATIC,FLAG_STATIC.PARTY_NAME+target," ")+" took {color_text `specred`}"+string(damage)+"{color_text `white`} damage!{pause}{end}"
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
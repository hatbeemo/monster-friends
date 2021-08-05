event_inherited();
audio_play_sound(snd_hurt,0,false);
Player_HurtParty(damage,target);
Player_EarnDamageSp(damage);
Camera_Shake(3,3,2,2);
Battle_SetDialog("* "+Flag_Get(FLAG_TYPE.STATIC,FLAG_STATIC.PARTY_NAME+target," ")+" took {color_text `specred`}"+string(damage)+"{color_text `white`} damage!{pause}{end}");
audio_stop_sound(snd_bombtick)
audio_stop_sound(snd_explosion)
audio_play_sound(snd_explosion,0,false)
if(type="DMG"){
	var bomb_num=0;
	with(battle_skill_bomb)
	{
		if(type="DMG"){
			bomb_num+=1
		}
	}
	Battle_SetMenuFightDamage(damage*bomb_num);
	Battle_SetMenu(BATTLE_MENU.SKILL_DAMAGE);
	Player_EarnDamageSp(damage);
	Battle_SetDialog("");
	done=2;
}else if(type="BLOCK"){
	audio_stop_sound(snd_vaporize)
	audio_play_sound(snd_vaporize,0,false)
	var proc=0
	repeat(4){
		var inst=instance_create_depth(40+proc*160,y+random(40),DEPTH_BATTLE.BULLET_OUTSIDE_HIGH,battle_skill_bomb_smoke)
		inst.image_blend=AQUA_COLOR
		proc+=1
	}
	var bomb_num=0;
	with(battle_skill_bomb)
	{
		if(type="BLOCK"){
			bomb_num+=1
		}
	}
	damage*=bomb_num
	if(battle_ui.party_size==1){
		Battle_SetDialog("* "+Player_GetPartyName(battle_ui.party_member[0])+" was protected by the&  Smoke Bomb!&* "+Player_GetPartyName(battle_ui.party_member[0])+" gained {color_text `specaqua2`}"+string(damage)+" BLOCK{color_text `white`}!{pause}{end}");
	}else{
		Battle_SetDialog("* Everyone was protected by the&  Smoke Bomb!&* Party gained {color_text `specaqua`}"+string(damage)+" BLOCK{color_text `white`}!{pause}{end}");
	}
	done=3;
}
Camera_Shake(6,6,2,2);
explode_timer=2;
explode_grow=1;
///@desc Anim
event_inherited();
if(Battle_GetAp()>=ap_cost)
{
	audio_play_sound(snd_player_atk,0,false)
	var inst = instance_create_depth(bomb_x[number%8],240,DEPTH_BATTLE.BULLET_OUTSIDE_LOW,battle_skill_bomb)
	inst.type="BLOCK"
	inst.fuse=fuse;
	inst.damage=fuse*2;
	Battle_SetDialog(text)
	Battle_SetAp(Battle_GetAp()-ap_cost)
}else{
	Battle_SetDialog("* Whimsie had insufficient AP to use&  "+use_name+"{color_text `white`}!{pause}{end}")
}
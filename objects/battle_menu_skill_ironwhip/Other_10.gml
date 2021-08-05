///@desc Anim
event_inherited();
if(Battle_GetAp()>=ap_cost)
{
	audio_play_sound(snd_player_atk,0,false)
	Battle_SetAp(Battle_GetAp()-ap_cost)
	Battle_SetDialog(text)
}else{
	Battle_SetDialog("* Gospel had insufficient AP to use&  "+use_name+"{color_text `white`}!{pause}{end}")
	_no_ap=true;
	Battle_SetMenuFightDamage(0);
}
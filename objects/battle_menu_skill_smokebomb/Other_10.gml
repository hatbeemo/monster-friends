///@desc Anim
event_inherited();
if(Battle_GetAp()>=ap_cost)
{
	var bomb_num=0
	with(battle_skill_bomb){
		if(x==other.bomb_x[other.number%8]){
			other.number+=1	
		}
		if(type=="BLOCK"){
			bomb_num+=1
		}
	}
	audio_play_sound(snd_player_atk,0,false)
	var inst = instance_create_depth(bomb_x[number%8],240,DEPTH_BATTLE.BULLET_OUTSIDE_LOW,battle_skill_bomb)
	inst.type="BLOCK"
	inst.fuse=fuse;
	inst.setfuse=fuse;
	inst.damage=fuse*2;
	inst.index=bomb_num
	Battle_SetDialog(text)
	Battle_SetAp(Battle_GetAp()-ap_cost)
}else{
	Battle_SetDialog("* Whimsie had insufficient AP to use&  "+use_name+"{color_text `white`}!{pause}{end}")
}
///@desc Explode
Battle_SetDialog("{sleep 999}");
audio_stop_sound(snd_bombtick)
audio_play_sound(snd_bombtick,0,true)
animating=2;
done=1;
alarm[0]=45
var bomb_num=1
with(battle_skill_bomb){
	if(type==other.type){
		bomb_num+=1
		index=bomb_num
	}
}
index=0
///@desc Anim
event_inherited();
audio_play_sound(snd_player_atk,0,false)
var inst = instance_create_depth(bomb_x[number%8],240,DEPTH_BATTLE.BULLET_OUTSIDE_LOW,battle_skill_bomb)
inst.type="BLOCK"
inst.fuse=fuse;
inst.damage=fuse*2;
Battle_SetDialog(text)

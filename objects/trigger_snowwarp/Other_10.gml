///@desc Trigger
persistent=true;
audio_play_sound(snd_flee,0,false);
char_player.visible=false;
char_player.moveable=false;
camera.target=noone;
if(room==room_sn_north){
	Anim_Create(camera,"x",ANIM_TWEEN.SINE,ANIM_EASE.IN,camera.x,650,90);
}else if(room==room_sn_main){
	Anim_Create(camera,"x",ANIM_TWEEN.SINE,ANIM_EASE.IN,camera.x,960-camera.x,90);
}
_triggered=true;
alarm[0]=70;
char_player.visible=false;
char_player.moveable=false;
camera.target=noone;
fader.color=c_black
Fader_Fade(-1,0,20);
if(room==room_tundra_upper){
	camera.y=200;
	Anim_Create(camera,"x",ANIM_TWEEN.SINE,ANIM_EASE.OUT,650,-600,90);
}else if(room==room_tundra_main){
	camera.y=180;
	Anim_Create(camera,"x",ANIM_TWEEN.SINE,ANIM_EASE.OUT,960,565,90);
}
alarm[3]=90;
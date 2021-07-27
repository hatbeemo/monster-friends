/// @description Insert description here
// You can write your code in this editor

// Inherit the parent event
if(!_triggered)
{
	_camera_ideal_y=240;
	_timer=0;
	camera.target=char_upcam;
	Anim_Create(char_upcam,"y",ANIM_TWEEN.LINEAR,ANIM_EASE.OUT,char_upcam.y,_camera_ideal_y-char_upcam.y,30);
	_triggered=true;
}
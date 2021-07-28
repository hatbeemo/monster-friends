/// @description Insert description here
// You can write your code in this editor

// Inherit the parent event
if(!_triggered){
	if(char_player._run_timer>=1){
		camera_set_view_speed(view_camera[0],5,5);
	}else{
		camera_set_view_speed(view_camera[0],3,3);
	}
	camera.target=char_upcam;
	_timer=0;
	_triggered=true;
}
event_inherited();
char_upcam.x = char_player.x
_timer += 1
if(_timer>=60){
	camera_set_view_speed(view_camera[0],-1,-1);
	_timer=60;
}else{
	if(char_player._run_timer>=1){
		camera_set_view_speed(view_camera[0],5,5);
	}else{
		camera_set_view_speed(view_camera[0],3,3);
	}	
}
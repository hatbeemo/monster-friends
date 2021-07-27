Flag_Set(FLAG_TYPE.TEMP,FLAG_TEMP.TRIGGER_WARP_LANDMARK,5);
if(instance_exists(char_player)){
	var pdir=DIR.DOWN;
	Flag_Set(FLAG_TYPE.TEMP,FLAG_TEMP.TRIGGER_WARP_DIR,pdir);
}
room_goto(target_room);
char_player.visible=true;
char_player.moveable=true;
camera.target=char_player;
persistent=false;
instance_destroy()
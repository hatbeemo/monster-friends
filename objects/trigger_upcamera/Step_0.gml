event_inherited();
char_upcam.x = char_player.x
if(!_triggered&&char_player.moveable){
	_timer += 1
	if(_timer>=30){
		Anim_Destroy(char_upcam,"y")
		char_upcam.y = 320
		camera.target=char_player;
	}
}
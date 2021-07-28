if(keyboard_check_pressed(ord("L"))&&_ball_typed==3){
	_ball_typed=4;
	audio_play_sound(snd_ballchime,0,false)
	//i'm sorry hatty
	with(char_waterdivot)
		sprite_index = spr_ihateyouall
}
if(keyboard_check_pressed(ord("L"))&&_ball_typed==2){
	_ball_typed=3;
}
if(keyboard_check_pressed(ord("A"))&&_ball_typed==1){
	_ball_typed=2;
}
if(keyboard_check_pressed(ord("B"))&&_ball_typed==0){
	_ball_typed=1;
}
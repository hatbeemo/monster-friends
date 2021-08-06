if(!instance_exists(text_typer)&&_done=0){
	attacking=true;
	_special_fx=1;
	alarm[0] = 160
	Anim_Create(battle_ui,"incoming_y",ANIM_TWEEN.SINE,ANIM_EASE.IN,battle_ui.incoming_y,100,25,0)
	Battle_SetDialog("{sleep 999}");
	_done=1;
}
if(!instance_exists(text_typer)&&!instance_exists(battle_damage)&&_done=1){
	event_user(3)
}
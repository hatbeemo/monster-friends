if(!instance_exists(text_typer)){
	event_user(3)
}
if(Input_IsHeld(INPUT.CANCEL)){
	if(alarm[0]>1)
		alarm[0]=1
}
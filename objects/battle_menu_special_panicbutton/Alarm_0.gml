attacking=false
if(instance_exists(battle_skill_bomb)){
	with(battle_skill_bomb){
		fuse=0;
		event_user(1)
	}
}else{
	Battle_SetDialog("* Whimsie's SPECIAL didn't do&  anything!{pause}{end}");	
}
_done=1;
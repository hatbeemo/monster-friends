attacking=false
if(instance_exists(battle_skill_bomb)){
	with(battle_skill_bomb){
		fuse=0;
		event_user(1)
	}
	Battlelog_Add("All the bombs were detonated!\n")
}else{
	Battle_SetDialog("* Whimsie's SPECIAL didn't do&  anything!{pause}{end}");	
	Battlelog_Add("Whimsie's SPECIAL didn't do anything!\n")
}
_done=1;
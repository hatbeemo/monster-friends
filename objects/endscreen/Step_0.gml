if(BGM_IsPlaying(5)){
	BGM_Stop(5)	
}
if(Input_IsPressed(INPUT.CANCEL)){
	Flag_Custom();
	room_goto(room_menuscreen)
}else if(Input_IsPressed(INPUT.MENU)){
	Battlelog_Download();
}else if(Input_IsPressed(INPUT.CONFIRM)){
	Flag_Custom();
	Battlelog_Init();
	var funmessage = choose("THIS MATCH WILL GET RED HOT!","A BRAWL IS SURELY BREWING!")
	Battlelog_Add("WHIMSIE VS GOSPEL!\n"+funmessage+"\n\nTURN 1 ---------------------\nFight begins!\n");
	Battlelog_Add("Whimsie's HP: 15/15\n")
	Battlelog_Add("Gospel's HP: 20/20\n");
	Battlelog_Add("Whimsie's AP: 3/10\n")
	Battlelog_Add("Gospel's AP: 3/10\n")
	Battlelog_Add("Whimsie's SP: 0/12\n")
	Battlelog_Add("Gospel's SP: 0/12\n")
	Battlelog_Add("Whimsie's Status: None\n")
	Battlelog_Add("Gospel's Status: None\n\n")
	Encounter_Start(1,false);
}
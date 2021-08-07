if(Input_IsPressed(INPUT.CONFIRM)){
	Battlelog_Init();
	var funmessage = choose("THIS MATCH WILL GET RED HOT!","A BRAWL IS SURELY BREWING!")
	Battlelog_Add("WHIMSIE VS GOSPEL!\n"+funmessage+"\n\nTURN 1 ---------------------\n* Gospel prepares to strike!\n\n");
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
if(Input_IsPressed(INPUT.MENU)){
	Flag_Set(FLAG_TYPE.STATIC,FLAG_STATIC.PARTY_PASSIVE,!Flag_Get(FLAG_TYPE.STATIC,FLAG_STATIC.PARTY_PASSIVE,0));
	if(Flag_Get(FLAG_TYPE.STATIC,FLAG_STATIC.PARTY_PASSIVE,0)==1){
		Flag_Set(FLAG_TYPE.TEMP,FLAG_TEMP.WHIMSIE_PASSIVE_ACTIVE,0);
	}else{
		Flag_Set(FLAG_TYPE.TEMP,FLAG_TEMP.WHIMSIE_PASSIVE_ACTIVE,2);	
	}
}
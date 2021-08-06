if(BGM_IsPlaying(5)){
	BGM_Stop(5)	
}
if(Input_IsPressed(INPUT.CONFIRM)){
	Flag_Custom();
	Encounter_Start(1,false);
}
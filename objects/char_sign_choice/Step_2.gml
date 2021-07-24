/// @description Choice Making
event_inherited();
depth=200-y;

c=Player_GetTextTyperChoice(); 
//TextTyperChoice is set to 0 or 1 depending on player choice
switch (c)
{
	case 0: //Choice 0
		if timetochoose==true{
			text = choice0; 
			Dialog_Add(text); //loads text AND prints it out
			timetochoose=false; //ensures this code only runs once
			text = afterchoice0; //sets text for 2nd interaction
			break; }
		else{
			break; }
	case 1: //Choice 1 
		if timetochoose==true{
			text = choice1;
			Dialog_Add(text);
			timetochoose=false;
			text = afterchoice1;
			break; }
		else{
			break; }
}
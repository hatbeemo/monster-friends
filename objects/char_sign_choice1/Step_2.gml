/// @description Choice Making
event_inherited();
depth=200-y;

var c1=Player_GetTextTyperChoice();
switch (c1)
{
	case 0: //Choice 0
		if timetochoose1==true{
			text1 = choice00;
			Dialog_Add(text1);
			timetochoose1=false;
			text1 = afterchoice00;
			break;
		}
		else{
			break;
		}
	case 1: //Choice 1 
		if timetochoose1==true{
			text1 = choice10;
			Dialog_Add(text1);
			timetochoose1=false;
			text1 = afterchoice10;
			break;
		}
		else{
			break;
		}
}


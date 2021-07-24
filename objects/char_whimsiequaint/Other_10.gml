event_inherited();
var line1="{face 10}{voice 3}* H-hi, my name is... {sleep 20}&* Wait...";
var line2="{face 12}{voice 3}* You're... m-me? {sleep 20}&* B-But how..?";
var line3="{face 11}{voice 3}* No, I-I'm me! {sleep 20}&* You're not r-real!";

talking=false;
switch(dialogue)
{
    case 0: 
		talking=true;
		text=line1; 
		dialogue+= 1;
		break;
    case 1: 
		talking=true;
		text=line2; 
		dialogue+= 1;
		break;
	case 2: 
		talking=true;
		text=line3; 
		break;
}
Dialog_Add(text);
Dialog_Start();

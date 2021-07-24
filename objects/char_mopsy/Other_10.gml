event_inherited();
var line1="{face 1}{voice 2}* Hi Whimsie! {sleep 20}&* We're Royal Games now! {sleep 20}&* Isn't that cool?";
var line2="{face 2}{voice 2}* I can't wait to make &new friends!";

switch(dialogue)
{
    case 0: 
		talking=true;
		ready=true;
		text=line1; 
		dialogue+= 1;
		break;
    case 1: 
		talking=true;
		ready=true;
		text=line2; 
		dialogue-= 1;
		break;
}
Dialog_Add(text);
Dialog_Start();


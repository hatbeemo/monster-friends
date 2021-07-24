//Create a variable called can_move equal to all the moveable variables made earlier.
//All the moveable variables = true. What does that mean?
var can_move=(moveable&&_moveable_dialog&&_moveable_menu&&_moveable_save&&_moveable_warp&&_moveable_encounter);

//WTF is Input_IsHeld?
//WTF is INPUT.UP?


if(can_move){
	if(Input_IsHeld(INPUT.UP)){
		move[DIR.UP]=2;
		//If the UP key is held, the move array stores the number 2 in the DIR.UP container?
	}else if(Input_IsHeld(INPUT.DOWN)){
		move[DIR.DOWN]=2;
		//If the DOWN key is held, the move array stores the number 2 in the DIR.DOWN container?
	}
	if(Input_IsHeld(INPUT.LEFT)){
		move[DIR.LEFT]=2;
		//If the LEFT key is held, the move array stores the number 2 in the DIR.LEFT container?
	}else if(Input_IsHeld(INPUT.RIGHT)){
		move[DIR.RIGHT]=2;
		//If the RIGHT key is held, the move array stores the number 2 in the DIR.RIGHT container?
	}
	if(Input_IsPressed(INPUT.CONFIRM)){
		var inst;
		inst=noone;
		//If the Z key is pressed (not held), create a local variable "inst", set to "noone". 
		//Local variables will be forgotten at the end of this event.
		if(dir==DIR.UP){
			inst=collision_rectangle(x-sprite_width/2+4,y-5,x+sprite_width/2-4,y-sprite_height+5,char,false,true);
		}
		if(dir==DIR.DOWN){
			inst=collision_rectangle(x-sprite_width/2+4,y-sprite_height+20,x+sprite_width/2-4,y+15,char,false,true);
		}
		if(dir==DIR.LEFT){
			inst=collision_rectangle(x,y-sprite_height+19,x+sprite_width/2-15,y,char,false,true);
		}
		if(dir==DIR.RIGHT){
			inst=collision_rectangle(x,y-sprite_height+19,x+sprite_width/2+15,y,char,false,true);
		//"collision rectangle" checks to see whether any instance of a given object...
		//...collides with a user defined rectangular area.
		//Maybe this is how Frisk collides with walls?
		}
		if(instance_exists(inst)){
			with(inst){
				event_user(0);
			}
		}
	}
	if(!instance_exists(ui_dialog)){
		if(Input_IsPressed(INPUT.MENU)){
			if(_can_menu==true){
				instance_create_depth(0,0,0,ui_menu);
			}
		}
	}
}

event_inherited();
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
//Check if we're moving and can run.
if(move[DIR.UP]>0 || move[DIR.DOWN]>0 || move[DIR.LEFT]>0 || move[DIR.RIGHT]>0){
	if(Input_IsHeld(INPUT.CANCEL)){
		//This variable checks if a collision was made in the char parent.
		if(_wall_bump){
			//Player is bumping into a wall, slow 'em down!
			_run_accel=0;
			_run_timer=0;
		    move_speed[DIR.UP]=2;
		    move_speed[DIR.DOWN]=2;
		    move_speed[DIR.LEFT]=2;
		    move_speed[DIR.RIGHT]=2;
		    res_move_speed[DIR.UP]=1/3;
		    res_move_speed[DIR.DOWN]=1/3;
		    res_move_speed[DIR.LEFT]=1/3;
		    res_move_speed[DIR.RIGHT]=1/3;
			//Make sure the player doesn't walk like a speed demon
			image_speed=res_move_speed[dir];
		}else{
			_run_timer+=1;
			//DELTARUNE runs at 30 FPS, while we're running 60 FPS, so the running speeds have to
			//be half that of DR's. This means the running speeds must be decimals.
			//Unfortunately it was jittery so I used the run timer here to turn it into
			//an alternating speed cycle and smooth it out. No decimals needed, and looks a lot nicer.
			_run_accel=(_run_timer%2?1:0);
			if(_run_timer>=20){
				_run_accel=1;
			}
			if(_run_timer>=120){
				_run_accel=(_run_timer%2?2:1);
			}
		    move_speed[DIR.UP]=2+_run_accel;
		    move_speed[DIR.DOWN]=2+_run_accel;
		    move_speed[DIR.LEFT]=2+_run_accel;
		    move_speed[DIR.RIGHT]=2+_run_accel;
		    res_move_speed[DIR.UP]=1/2;
		    res_move_speed[DIR.DOWN]=1/2;
		    res_move_speed[DIR.LEFT]=1/2;
		    res_move_speed[DIR.RIGHT]=1/2;
			image_speed=res_move_speed[dir];
		}
	}else if(!Input_IsHeld(INPUT.CANCEL)){
		//We're obviously not running.
		_run_accel=0;
		_run_timer=0;
	    move_speed[DIR.UP]=2;
	    move_speed[DIR.DOWN]=2;
	    move_speed[DIR.LEFT]=2;
	    move_speed[DIR.RIGHT]=2;
	    res_move_speed[DIR.UP]=1/3;
	    res_move_speed[DIR.DOWN]=1/3;
	    res_move_speed[DIR.LEFT]=1/3;
	    res_move_speed[DIR.RIGHT]=1/3;
		image_speed=res_move_speed[dir];
	}
}else{
	//Stopping in the middle of a run slows your next run.
	_run_accel=0;
	_run_timer=0;
	move_speed[DIR.UP]=2;
	move_speed[DIR.DOWN]=2;
	move_speed[DIR.LEFT]=2;
	move_speed[DIR.RIGHT]=2;
	res_move_speed[DIR.UP]=1/3;
	res_move_speed[DIR.DOWN]=1/3;
	res_move_speed[DIR.LEFT]=1/3;
	res_move_speed[DIR.RIGHT]=1/3;
}
event_inherited();
x+=sin(_divot_timer/12)*0.1;
_divot_timer+=1;
if (room==room_tundra_upper){
	if(y>room_height){
		y = -10	
	}
}else{
	if(x>room_width){
		x = 1600
	}
}
if(color_timer>0){
	image_blend=merge_color(c_white,new_color,clamp(color_timer,0,1));
	color_timer-=0.05;
}else{
	image_blend=c_white
}
draw_self()
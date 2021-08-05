if(bar_visible&&damage>0){
	draw_sprite_ext(spr_pixel,0,xstart-bar_width/2,ystart+18,bar_width,13,0,c_dkgray,1);
	draw_sprite_ext(spr_pixel,0,xstart-bar_width/2,ystart+18,bar_width/bar_hp_max*bar_hp_original,13,0,RED_COLOR,1);
	draw_sprite_ext(spr_pixel,0,xstart-bar_width/2,ystart+18,bar_width/bar_hp_max*_bar_hp,13,0,LIME_COLOR,1);
}

if(damage<=0){
	draw_sprite_ext(spr_battle_damage_miss,0,xstart,y,2,2,0,c_gray,1);
}else{
	var STR=(sign(damage) == 1 ? "-" : "+")+string(damage);
	var LEN=string_length(STR);
	var SPR_W=sprite_get_width(spr_battle_damage);
	var draw_x=x;
	
	if(LEN%2!=0){
		draw_x-=(LEN-1)*((SPR_W+1)/2);
	}else{
		draw_x-=((SPR_W)/2)+(LEN/2-1)*(SPR_W+1);
	}
	draw_set_font(global.DAMAGE_FONT)
	draw_text_transformed_color(draw_x-14,y-14,STR,2,2,0,color,color,color,color,1)
}
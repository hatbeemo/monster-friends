draw_set_halign(fa_center)
draw_set_font(font_8bit_wonder)
draw_set_color(c_white)
draw_text_transformed(320,20,text,3,3,0)
draw_set_font(determination_sans)
draw_text_transformed(320,80,"Press Z or ENTER to retry.",2,2,0)
draw_set_halign(fa_left)
if(won==true){
	
}else{
	draw_text_transformed(20,120,"Gospel's HP:",2,2,0)
	draw_sprite_ext(spr_battle_ui_face,7,20,160,1,1,0,GOSPEL_COLOR,1);
	var X=60;
	var Y=160;
	draw_sprite_ext(spr_pixel,0,X+20,Y,76,9,0,MAROON_COLOR,1);
	draw_sprite_ext(spr_pixel,0,X+20,Y,76/20*global.gospel_hp,9,0,GOSPEL_COLOR,1);
	draw_sprite(spr_battle_menu_hpicon,0,X,Y)
	draw_set_font(global.HP_FONT);
	draw_sprite(spr_battle_menu_hpslash,0,X+50,Y+12);
	draw_set_halign(fa_right);
	draw_text(X+49,Y+12,string(global.gospel_hp));
	draw_text(X+49+45,Y+12,"20");
	draw_set_halign(fa_left);
	draw_set_font(determination_sans)
	draw_text_transformed(20,190,"Turns Lasted: "+string(global.turns_lasted+1),2,2,0)
	draw_text_transformed(20,340,"Tips:",2,2,0)
	draw_set_font(determination_mono)
	draw_text_transformed(20,374,tips[current_tip],2,2,0)
}
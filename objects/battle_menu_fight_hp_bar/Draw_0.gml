var DIALOG=battle._dialog[0];

if(instance_exists(DIALOG)){
	var SLOT=Battle_ConvertEnemySlotToMenuChoiceEnemy(enemy_slot);
	if(player_mode){
		SLOT=enemy_slot
	}
	var X=493-width;
	var Y=374+12+32*SLOT;
	if(show_bar){
		draw_sprite_ext(spr_pixel,0,X+20,Y,width,9,0,MAROON_COLOR,1);
		draw_sprite_ext(spr_pixel,0,X+20,Y,width/hp_max*hp,9,0,color,1);
		draw_sprite(spr_battle_menu_hpicon,0,X,Y)
	}else{
		draw_sprite(spr_battle_menu_hpicon,0,X+width,Y)	
	}
	draw_set_font(global.HP_FONT);
	draw_sprite(spr_battle_menu_hpslash,0,X+width+50,Y-2);
	draw_set_halign(fa_right);
	draw_text(X+width+49,Y-2,string(hp));
	draw_text(X+width+49+45,Y-2,string(hp_max));
	draw_set_halign(fa_left);
}
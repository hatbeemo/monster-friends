draw_sprite_ext(spr_pixel,0,32,72+(_top ? 250 : 0),142,90,0,c_white,1);
draw_sprite_ext(spr_pixel,0,32+6,72+6+(_top ? 250 : 0),142-6*2,90-6*2,0,c_black,1);

draw_sprite_ext(spr_pixel,0,32,168,142,148,0,c_white,1);
draw_sprite_ext(spr_pixel,0,32+6,168+6,142-6*2,148-6*2,0,c_black,1);

draw_set_font(font_crypt_of_tomorrow);
draw_set_color(c_white);
draw_text_ext_transformed(32+6+8,72+(_top ? 250 : 0)+6+42,"HP  "+string(Flag_Get(FLAG_TYPE.STATIC,FLAG_STATIC.HP))+"/"+string(Flag_Get(FLAG_TYPE.STATIC,FLAG_STATIC.HP_MAX))+"\nG   "+string(Flag_Get(FLAG_TYPE.STATIC,FLAG_STATIC.GOLD)),9,-1,2,2,0);

if(_menu==0){
	draw_sprite(spr_battle_soul_red,0,32+6+27,168+6+31+36*_choice);
}

//ITEM
if(_menu==1||_menu==2){
	draw_sprite_ext(spr_pixel,0,188,52,346,362,0,c_white,1);
	draw_sprite_ext(spr_pixel,0,188+6,52+6,346-6*2,362-6*2,0,c_black,1);
}

if(_menu==1){
	draw_sprite(spr_battle_soul_red,0,188+6+23,52+6+39+32*_choice_item);
}

if(_menu==2){
	var X=0;
	switch(_choice_item_operate){
		case 0:
			X=23;
			break;
		case 1:
			X=119;
			break;
		case 2:
			X=233;
			break;
	}
	draw_sprite(spr_battle_soul_red,0,188+6+X,52+6+319);
}

//STAT
if(_menu==3){
	draw_sprite_ext(spr_pixel,0,188,52,386,418,0,c_white,1);
	draw_sprite_ext(spr_pixel,0,188+6,52+6,386-6*2,418-6*2,0,c_black,1);
}

//PHONE
if(_menu==4){
	draw_sprite_ext(spr_pixel,0,188,52,346,270,0,c_white,1);
	draw_sprite_ext(spr_pixel,0,188+6,52+6,346-6*2,270-6*2,0,c_black,1);
	draw_sprite(spr_battle_soul_red,0,188+6+23,52+6+39+32*_choice_phone);
}
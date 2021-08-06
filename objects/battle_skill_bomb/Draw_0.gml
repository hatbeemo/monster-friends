if (y>ystart&&bounce<2){
	audio_play_sound(snd_noise,0,false)
	y=ystart;
	vspeed=-2.5;
	bounce+=1;
}
if (bounce>=2){
	y=ystart;
	vspeed=0;
}
if(animating==1){
	anim+=0.1
}
if(animating==2){
	anim+=0.25
}
if(done>=2){
	explode_timer-=0.1
	if(explode_timer<0&&done==3){
		instance_destroy()
	}
	explode_grow+=0.05
	if(type=="DMG"){
		draw_sprite_ext(spr_battle_skill_bomb_explode,0,x,y,explode_grow,explode_grow,0,RED_COLOR,clamp(explode_timer,0,1))
	}else if(type=="BLOCK"){
		draw_sprite_ext(spr_battle_skill_bomb_explode,0,x,y,explode_grow,explode_grow,0,AQUA_COLOR,clamp(explode_timer,0,1))
	}else{
		draw_sprite_ext(spr_battle_skill_bomb_explode,0,x,y,explode_grow,explode_grow,0,c_white,clamp(explode_timer,0,1))
	}
}else{
	draw_sprite(spr_battle_skill_bomb,anim%2+1,x,y)
	if(type=="DMG"){
		draw_sprite_ext(spr_battle_skill_bomb,0,x,y,1,1,0,c_red,1)
		draw_set_color(c_red)
	}else if(type=="BLOCK"){
		draw_sprite_ext(spr_battle_skill_bomb,0,x,y,1,1,0,DULLAQUA_COLOR,1)
		draw_set_color(DULLAQUA_COLOR)
	}else{
		draw_sprite_ext(spr_battle_skill_bomb,0,x,y,1,1,0,c_white,1)
		draw_set_color(c_white)
	}
	draw_set_font(global.DAMAGE_FONT)
	draw_set_halign(fa_center)
	draw_text(x+4,y-sprite_height-20,string(fuse))
}
draw_set_halign(fa_left)
draw_set_color(c_white)
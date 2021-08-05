if(_special_fx)
{
	if(_fx_timer==0)
	{
		Fader_Fade(-1,0.5,30)
		Anim_Create(self,"special_y",ANIM_TWEEN.SINE,ANIM_EASE.IN,-120,260,30,0)
	}
	if(_fx_timer==30)
	{
		Anim_Destroy(self,"special_y")
		Anim_Create(self,"special_y",ANIM_TWEEN.LINEAR,ANIM_EASE.IN_OUT,140,80,80,0)
	}
	if(_fx_timer<30+80&&_fx_timer%4==0)
	{
		instance_create_depth(0,0,DEPTH_BATTLE.UI_HIGH,battle_fx_speedline)
	}
	if(_fx_timer==30+80)
	{
		Fader_Fade(-1,0,30)
		Anim_Destroy(self,"special_y")
		Anim_Create(self,"special_y",ANIM_TWEEN.SINE,ANIM_EASE.IN,140+80,520,30,0)
	}
	_fx_timer+=1
	draw_set_color(c_white)
	draw_sprite(spr_battle_ui_specialincoming,0,0,special_y)
	draw_set_halign(fa_center)
	draw_set_font(font_8bit_wonder)
	draw_text_transformed(320,special_y+12,name,2,2,0)
	draw_set_halign(fa_left)
}
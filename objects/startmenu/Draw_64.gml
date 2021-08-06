draw_set_halign(fa_center)
draw_set_font(font_8bit_wonder)
draw_set_color(c_white)
draw_text_transformed(320,20,"PLACEHOLDER",3,3,0)
draw_set_font(determination_sans)
passive_on="OFF"
if(Flag_Get(FLAG_TYPE.STATIC,FLAG_STATIC.PARTY_PASSIVE,0)==1){
	passive_on="ON"
}
draw_text_transformed(320,80,"Press Z or ENTER to play.\n\nPress C to toggle Fast Arms.\n("+passive_on+")",2,2,0)
draw_set_halign(fa_left)
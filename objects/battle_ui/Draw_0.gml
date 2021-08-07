draw_set_color(c_white);
draw_sprite_ext(spr_battle_ui_bars,0,x,y+303,1,1,0,bar_color,1);
var i = 0
repeat(Flag_Get(FLAG_TYPE.STATIC,FLAG_STATIC.AP_MAX,10)){
	if(i<Flag_Get(FLAG_TYPE.STATIC,FLAG_STATIC.AP,0)&&i<display_ap){
		draw_sprite(spr_battle_ui_ap_segment,1,x+22+37+24*i,y+303+47);
	}else if(i < Flag_Get(FLAG_TYPE.STATIC,FLAG_STATIC.AP,0)){
		draw_sprite(spr_battle_ui_ap_segment,3,x+22+37+24*i,y+303+47);
	}else{
		draw_sprite(spr_battle_ui_ap_segment,0,x+22+37+24*i,y+303+47);
	}
	i += 1
}
i=Flag_Get(FLAG_TYPE.STATIC,FLAG_STATIC.AP,0)-1
if(use_ap>0){
	repeat(clamp(use_ap,1,Flag_Get(FLAG_TYPE.STATIC,FLAG_STATIC.AP,0))){
		draw_sprite(spr_battle_ui_ap_segment,2,x+22+37+24*i,y+303+47);
		i -= 1
	}
}
i=Flag_Get(FLAG_TYPE.STATIC,FLAG_STATIC.AP,0)
if(use_ap>Flag_Get(FLAG_TYPE.STATIC,FLAG_STATIC.AP,0)){
	repeat(use_ap-Flag_Get(FLAG_TYPE.STATIC,FLAG_STATIC.AP,0)){
		draw_sprite(spr_battle_ui_ap_segment,4,x+22+37+24*i,y+303+47);
		i += 1
	}
}
draw_sprite(spr_battle_ui_ap,0,x+22,y+303+47);
draw_sprite(spr_battle_ui_ap_segment,5,x+22+37,y+303+47);
draw_sprite(spr_battle_ui_ap_segment,6,x+22+37+24*(Flag_Get(FLAG_TYPE.STATIC,FLAG_STATIC.AP_MAX,10)-1),y+303+47);
draw_sprite(spr_battle_ui_sp,0,x+389,y+303+46);
var i = 0
var sp=Flag_Get(FLAG_TYPE.STATIC,FLAG_STATIC.SP,0);
repeat(Flag_Get(FLAG_TYPE.STATIC,FLAG_STATIC.SP_MAX,12)){
	if(i==0||i==1||i==2||i==3||i==4||i==5||i==6||i==7||i==8||i==9||i==10||i==11||i==12){
		if(i<Flag_Get(FLAG_TYPE.STATIC,FLAG_STATIC.SP,0)){
			draw_sprite(spr_battle_ui_sp_star,1,x+389+175-16*i,y+303+46);
		}
	}
	if(sp==0.5||sp==1.5||sp==2.5||sp==3.5||sp==4.5||sp==5.5||sp==6.5||sp==7.5||sp==8.5||sp==9.5||sp==10.5||sp==11.5){
		if(i<Flag_Get(FLAG_TYPE.STATIC,FLAG_STATIC.SP,0)){
			draw_sprite(spr_battle_ui_sp_star,3,x+389+175-16*(sp-0.5),y+303+46);
		}
	}
	i += 1
}
var i = 0
if(!surface_exists(_surface)){
	_surface=surface_create(640,37);
}
var add = 303
if(party_swap){
	surface_set_target(_surface);
	draw_clear_alpha(0,0);
	add = -2
}
repeat(party_size){
	draw_sprite(spr_battle_button_special,button[4,i],x+party_x[i]+10,y+313+menu_y_special[i]);
	if(menu_open==i||menu_close==i)
	{
		draw_sprite_ext(spr_battle_ui_statboxlower,0,x+party_x[i],y+313,1,1,0,party_color[i],1);
		_matrix_timer+=1;
		draw_set_color(party_color[i])
		var j = 0
		repeat(12)
		{
		    var matrix_x = _matrix_timer+j*(pi*10);
		    draw_set_alpha(sin(matrix_x / 60));
		    if (cos((matrix_x / 60)) < 0)
		    {
				draw_line_width(x+party_x[i]-sin(matrix_x/60)*30+31,y+312,x+party_x[i]-sin(matrix_x/60)*30+31,y+312+30,2);
				draw_line_width(x+party_x[i]+207+sin(matrix_x/60)*30,y+312,x+party_x[i]+207+sin(matrix_x/60)*30,y+312+30,2);
		    }
			j+=1;
		}
		draw_set_alpha(1)
		draw_set_color(c_white)
		var MENU=Battle_GetMenu();
		if(MENU==BATTLE_MENU.SKILL_POWER){
			draw_sprite(spr_battle_button_skillpower,0+button[0,i]*4,x+party_x[i]+10,y+313+4);
			draw_sprite(spr_battle_button_skillpower,1+button[1,i]*4,x+party_x[i]+10+54,y+313+4);
			draw_sprite(spr_battle_button_skillpower,2+button[2,i]*4,x+party_x[i]+10+54+54,y+313+4);
			draw_sprite(spr_battle_button_skillpower,3+button[3,i]*4,x+party_x[i]+10+54+54+54,y+313+4);
		}else if(MENU==BATTLE_MENU.SKILL_FUSE){
			draw_sprite(spr_battle_button_skillfuse,0+button[0,i]*3,x+party_x[i]+10,y+313+4);
			draw_sprite(spr_battle_button_skillfuse,1+button[1,i]*3,x+party_x[i]+10+72,y+313+4);
			draw_sprite(spr_battle_button_skillfuse,2+button[2,i]*3,x+party_x[i]+10+72+72,y+313+4);
		}else{
			draw_sprite(spr_battle_button_skill,button[0,i],x+party_x[i]+10,y+313+4);
			draw_sprite(spr_battle_button_check,button[1,i],x+party_x[i]+80,y+313+4);
			draw_sprite(spr_battle_button_bag,button[2,i],x+party_x[i]+150,y+313+4);
			draw_sprite(spr_battle_button_block,button[3,i],x+party_x[i]+206,y+313+4);
		}
		draw_sprite_ext(spr_battle_ui_statbox,1,x+party_x[i],y+add+swap_y[i]+menu_y[i],1,1,0,party_color[i],1);
	}
	draw_sprite(spr_battle_ui_statbox,0,x+party_x[i],y+add+swap_y[i]+menu_y[i]);
	draw_sprite_ext(spr_battle_ui_statbox,1,x+party_x[i],y+add+swap_y[i]+menu_y[i],1,1,0,party_color[i],box_alpha_timer[i]);
	draw_sprite_ext(spr_battle_ui_face,party_type[i],x+party_x[i]+10,y+add+8+swap_y[i]+menu_y[i],1,1,0,party_color[i],1);
	draw_sprite_ext(spr_battle_ui_name,party_name[i],x+party_x[i]+51,y+add+14+swap_y[i]+menu_y[i],1,1,0,name_color[i],1);
	draw_sprite_ext(spr_battle_menu_hpicon,party_name[i],x+party_x[i]+135,y+add+23+swap_y[i]+menu_y[i],1,1,0,hp_color[i],1);
	draw_sprite_ext(spr_battle_menu_hpslash,party_name[i],x+party_x[i]+186,y+add+10+swap_y[i]+menu_y[i],1,1,0,hp_color[i],1);
	if(Battle_GetPartyBlock(party_member[i])>0){
		draw_sprite_ext(spr_pixel,0,x+party_x[i]+152,y+add+21+swap_y[i]+menu_y[i],78,13,0,c_white,1);
		draw_sprite_ext(spr_pixel,0,x+party_x[i]+151,y+add+22+swap_y[i]+menu_y[i],80,11,0,c_white,1);
	}
	draw_sprite_ext(spr_pixel,0,x+party_x[i]+153,y+add+23+swap_y[i]+menu_y[i],76,9,0,MAROON_COLOR,1);
	if(Battle_GetPartyBlock(party_member[i])>0){
		draw_sprite_ext(spr_pixel,0,x+party_x[i]+153,y+add+23+swap_y[i]+menu_y[i],clamp((Player_GetPartyHp(party_member[i])+Battle_GetPartyBlock(party_member[i]))/Player_GetPartyHpMax(party_member[i])*76,0,76),9,0,DEEPAQUA_COLOR,1);
	}
	draw_sprite_ext(spr_pixel,0,x+party_x[i]+153,y+add+23+swap_y[i]+menu_y[i],Player_GetPartyHp(party_member[i])/Player_GetPartyHpMax(party_member[i])*76,9,0,party_color[i],1);
	draw_set_font(global.HP_FONT);
	draw_set_color(hp_color[i])
	draw_set_halign(fa_right);
	draw_text(x+party_x[i]+182,y+add+10+swap_y[i]+menu_y[i],string(Player_GetPartyHp(party_member[i])+Battle_GetPartyBlock(party_member[i])));
	draw_text(x+party_x[i]+227,y+add+10+swap_y[i]+menu_y[i],string(Player_GetPartyHpMax(party_member[i])));
	draw_set_color(c_white)
	i += 1
}
if(party_swap){
	surface_reset_target();
	draw_surface(_surface,x,y+305);
	if(party_swap==2){
		party_swap=0;
	}
}
if(!Battle_GetCutsceneMode()){
	var k = 0
	var l = 0
	var ap_x=320-138;
	var show_sp=false;
	repeat(4){
		if(party_member[l]==3){
			ap_x=32;
			show_sp=true;
		}
		l+=1
	}
	repeat(Flag_Get(FLAG_TYPE.TEMP,FLAG_TEMP.ENEMY_AP_MAX,10)){
		if(k<Flag_Get(FLAG_TYPE.TEMP,FLAG_TEMP.ENEMY_AP,0)&&k<display_enemy_ap){
			draw_sprite(spr_battle_upper_enemy_ap_segment,1,x+ap_x+28*k,y+4);
		}else if(k<Flag_Get(FLAG_TYPE.TEMP,FLAG_TEMP.ENEMY_AP,0)){
			draw_sprite(spr_battle_upper_enemy_ap_segment,2,x+ap_x+28*k,y+4);
		}else{
			draw_sprite(spr_battle_upper_enemy_ap_segment,0,x+ap_x+28*k,y+4);
		}
		k += 1
	}
	draw_sprite(spr_battle_upper_enemy_ap,0,x+ap_x,y+4);
	l=0
	repeat(4){
		if(party_member[l]==3){
			draw_sprite(spr_battle_upper_enemy_sp,0,x+420,y+4);
			var sp=Flag_Get(FLAG_TYPE.TEMP,FLAG_TEMP.ENEMY_SP,0);
			k=0;
			repeat(Flag_Get(FLAG_TYPE.TEMP,FLAG_TEMP.ENEMY_SP_MAX,12)){
				if(k==0||k==1||k==2||k==3||k==4||k==5||k==6||k==7||k==8||k==9||k==10||k==11||k==12){
					if(k<Flag_Get(FLAG_TYPE.TEMP,FLAG_TEMP.ENEMY_SP,0)){
						draw_sprite(spr_battle_upper_enemy_sp_star,1,x+420+16*k,y+4);
					}
				}
				if(sp==0.5||sp==1.5||sp==2.5||sp==3.5||sp==4.5||sp==5.5||sp==6.5||sp==7.5||sp==8.5||sp==9.5||sp==10.5||sp==11.5){
					if(k<Flag_Get(FLAG_TYPE.TEMP,FLAG_TEMP.ENEMY_SP,0)){
						draw_sprite(spr_battle_upper_enemy_sp_star,3,x+420+16*(sp-0.5),y+4);
					}
				}
				k+=1;
			}
			l+=1
		}
	}
}
draw_sprite_ext(spr_battle_upper_infobar,0,x,y,1,1,0,c_white,hint_active);
draw_set_font(font_8bit_wonder);
draw_set_halign(fa_center);
if(instance_exists(battle_enemy_autoriel)){
	if(battle.turn_progress<array_length(battle.battle_turn_order)){
		if(battle.battle_turn_order[battle.turn_progress]==3||Battle_GetState()==BATTLE_STATE.SECOND_ATTACK_PHASE)&&(!instance_exists(battle_attack_special)){
			draw_sprite_ext(spr_battle_upper_incoming_autoriel,0,x+160,y-incoming_y,1,1,0,incoming_color,1);
			draw_sprite_ext(spr_battle_upper_incoming_autoriel,0,x+480,y-incoming_y2,1,1,0,incoming_color2,1);
		}else{
			draw_sprite_ext(spr_battle_upper_incoming,0,x+320,y-incoming_y,1,1,0,incoming_color,1);
		}
	}else{
		draw_sprite_ext(spr_battle_upper_incoming,0,x+320,y-incoming_y,1,1,0,incoming_color,1);
	}
}else{
	draw_sprite_ext(spr_battle_upper_incoming,0,x+320,y-incoming_y,1,1,0,incoming_color,1);
}
var STATE=Battle_GetState();
if(STATE==BATTLE_STATE.ATTACK_PHASE){
	incoming_timer+=1;
	draw_set_color(merge_color(incoming_color,c_black,clamp(incoming_timer/15,0,1)))
}else{
	incoming_timer=0;
	draw_set_color(c_white)
}
if(instance_exists(battle_enemy_autoriel)){
	if(battle.turn_progress<array_length(battle.battle_turn_order)){
		if(battle.battle_turn_order[battle.turn_progress]==3||Battle_GetState()==BATTLE_STATE.SECOND_ATTACK_PHASE)&&(!instance_exists(battle_attack_special)&&!instance_exists(battle_menu_skill_special)){
			draw_text(x+160,y-incoming_y+26,incoming_name)
			if(STATE==BATTLE_STATE.SECOND_ATTACK_PHASE){
				incoming_timer2+=1;
				draw_set_color(merge_color(incoming_color,c_black,clamp(incoming_timer2/15,0,1)))
			}else{
				incoming_timer2=0;
				draw_set_color(c_white)
			}
			draw_text(x+480,y-incoming_y2+26,incoming_name2)
		}else{
			if(instance_exists(battle_attack_special)||instance_exists(battle_menu_skill_special)){
				draw_sprite(spr_battle_upper_incoming_specialtxt,0,x+320,y-incoming_y+26)
			}else{
				draw_text(x+320,y-incoming_y+26,incoming_name)
			}
		}
	}else{
		if(instance_exists(battle_attack_special)||instance_exists(battle_menu_skill_special)){
			draw_sprite(spr_battle_upper_incoming_specialtxt,0,x+320,y-incoming_y+24)
		}else{
			draw_text(x+320,y-incoming_y+26,incoming_name)
		}
	}
}else if(instance_exists(battle_attack_special)||instance_exists(battle_menu_skill_special)){
	draw_sprite(spr_battle_upper_incoming_specialtxt,0,x+320,y-incoming_y+26)
}else{
	draw_text(x+320,y-incoming_y+26,incoming_name)
}
if(!Battle_GetCutsceneMode()){
	draw_set_color(c_white)
	draw_set_halign(fa_right)
	draw_text(640,-2,string(Battle_GetTurnNumber()+1));
	draw_set_halign(fa_left)
}
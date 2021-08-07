//if(keyboard_check(vk_up)){
//	party_swap=1;
//	swap_y[0]-=1;
//}else if(keyboard_check(vk_down)){
//	party_swap=1;
//	swap_y[0]+=1;
//}else{
//	if(party_swap){
//		party_swap=2;
//	}
//	swap_y[0]=0;
//	swap_y[1]=0;
//}
if(menu_open>=0||menu_closed>=0){
	var sp = Battle_GetSp()
	var open = menu_open
	var close = menu_close
	if(!menu_opened&&open>=0&&sp>=6){
		_menu_move_3=0;
		Anim_Create(self,"_menu_move_3",ANIM_TWEEN.SINE,ANIM_EASE.OUT,0,-64,15);
	}else if(!menu_closed&&close>=0){
		Anim_Destroy(self,"_menu_move_3")
		Anim_Create(self,"_menu_move_3",ANIM_TWEEN.SINE,ANIM_EASE.OUT,_menu_move_3,-_menu_move_3,15);
	}
	menu_y_special[Flag_Get(FLAG_TYPE.TEMP,FLAG_TEMP.MEMBER_ACTIVE,0)] = _menu_move_3
	if(!menu_opened&&open>=0){
		_menu_move=0;
		Anim_Create(self,"_menu_move",ANIM_TWEEN.SINE,ANIM_EASE.OUT,0,-29,15,0);
		menu_opened=true;
	}
	if(open==2){
		menu_y[0] = _menu_move
		menu_y[1] = _menu_move
	}else if(open>=0){
		menu_y[open] = _menu_move
	}
	if(!menu_closed&&close>=0){
		_menu_move_2=-29;
		Anim_Create(self,"_menu_move_2",ANIM_TWEEN.LINEAR,ANIM_EASE.OUT,-29,29,7,0);
		menu_closed=true;
	}
	if(close==2){
		menu_y[0] = _menu_move_2
		menu_y[1] = _menu_move_2
	}else if(close>=0){
		menu_y[close] = _menu_move_2
	}
	if(_menu_move_2>=0)
	{
		menu_close=-1;	
		Anim_Destroy(self,"_menu_move_2");
	}
}
var STATUS=Battle_GetState();
var MENU=Battle_GetMenu();

if(MENU==BATTLE_MENU.SKILL_POWER||MENU==BATTLE_MENU.SKILL_FUSE){
	button[0,Flag_Get(FLAG_TYPE.TEMP,FLAG_TEMP.MEMBER_ACTIVE,0)]=0;
	button[1,Flag_Get(FLAG_TYPE.TEMP,FLAG_TEMP.MEMBER_ACTIVE,0)]=0;
	button[2,Flag_Get(FLAG_TYPE.TEMP,FLAG_TEMP.MEMBER_ACTIVE,0)]=0;
	button[3,Flag_Get(FLAG_TYPE.TEMP,FLAG_TEMP.MEMBER_ACTIVE,0)]=0;
	button[Battle_GetMenuChoiceSkillPower(),Flag_Get(FLAG_TYPE.TEMP,FLAG_TEMP.MEMBER_ACTIVE,0)]=1;
}else if(STATUS==BATTLE_STATE.MENU && MENU!=BATTLE_MENU.SKILL_EVENT && MENU!=BATTLE_MENU.BAG_EVENT && MENU!=BATTLE_MENU.SKILL_DAMAGE && MENU!=BATTLE_MENU.SKILL_DAMAGE_EXTRA && MENU!=BATTLE_MENU.SPECIAL){
	button[0,Flag_Get(FLAG_TYPE.TEMP,FLAG_TEMP.MEMBER_ACTIVE,0)]=0;
	button[1,Flag_Get(FLAG_TYPE.TEMP,FLAG_TEMP.MEMBER_ACTIVE,0)]=0;
	button[2,Flag_Get(FLAG_TYPE.TEMP,FLAG_TEMP.MEMBER_ACTIVE,0)]=0;
	button[3,Flag_Get(FLAG_TYPE.TEMP,FLAG_TEMP.MEMBER_ACTIVE,0)]=0;
	button[4,Flag_Get(FLAG_TYPE.TEMP,FLAG_TEMP.MEMBER_ACTIVE,0)]=0;
	button[Battle_GetMenuChoiceButton(),Flag_Get(FLAG_TYPE.TEMP,FLAG_TEMP.MEMBER_ACTIVE,0)]=1;
}else{
	button[0,0]=0;
	button[1,0]=0;
	button[2,0]=0;
	button[3,0]=0;
	button[4,0]=0;
	button[0,1]=0;
	button[1,1]=0;
	button[2,1]=0;
	button[3,1]=0;
	button[4,1]=0;
}
if(bar_color_timer>0){
	bar_color=merge_color(c_dkgray,new_bar_color,clamp(bar_color_timer,0,1));
	bar_color_timer-=0.05;
}else{
	bar_color=c_dkgray
}
var proc=0;
repeat(2){
	var col=default_party_color[proc];
	if(Player_GetPartyHp(party_member[proc])<=0){
		col=DKGRAY_COLOR;	
	}
	if(party_color_timer[proc]>0){
		party_color[proc]=merge_color(col,new_party_color[proc],clamp(party_color_timer[proc],0,1));
		party_color_timer[proc]-=0.05;
	}else{
		party_color[proc]=col
	}
	var col=c_white
	if(Player_GetPartyHp(party_member[proc])<=0){
		col=DKGRAY_COLOR;	
	}
	if(name_color_timer[proc]>0){
		name_color[proc]=merge_color(col,new_name_color[proc],clamp(name_color_timer[proc],0,1));
		name_color_timer[proc]-=0.05;
	}else{
		name_color[proc]=col
	}
	if(hp_color_timer[proc]>0){
		hp_color[proc]=merge_color(col,new_hp_color[proc],clamp(hp_color_timer[proc],0,1));
		hp_color_timer[proc]-=0.05;
	}else{
		hp_color[proc]=col
	}
	proc+=1
}
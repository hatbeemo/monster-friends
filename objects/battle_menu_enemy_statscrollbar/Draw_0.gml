var proc=0;
var NUMBER=3;
var CURRENT=Battle_GetMenuChoiceCheckDesc();

repeat(NUMBER){
	draw_sprite(spr_battle_menu_item_scrollbar_dot,proc==CURRENT,x,y-10*floor(NUMBER/2)+30*proc);
	proc+=1;
}
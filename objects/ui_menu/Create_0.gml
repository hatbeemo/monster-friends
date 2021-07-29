depth=DEPTH_UI.PANEL;

if(instance_exists(char_player)){
	_top=(char_player.y-camera.y>130+char_player.sprite_height);
	char_player._moveable_menu=false;
}else{
	_top=false;
}

_menu=0;
_choice=0;
_choice_item=0;
_choice_item_operate=0;
_choice_phone=0;

_prefix="{shadow false}{scale 2}{font 1}{instant true}{gui true}{depth "+string(DEPTH_UI.TEXT)+"}";
_inst_name=noone;
_inst_menu=noone;
_inst_item=noone;
_inst_item_use=noone;
_inst_item_info=noone;
_inst_item_drop=noone;
_inst_list_0=noone;
_inst_list_1=noone;
_inst_phone=noone;

_inst_name=instance_create_depth(32+6+8,72+6+(_top ? 250 : 0)+2,0,text_typer);
_inst_name.text=_prefix+Flag_Get(FLAG_TYPE.STATIC,FLAG_STATIC.NAME);

var objs=0;
var npcs=0;
for(var i=real(room)*100;i<instance_number(char_interact)+real(room)*100;i++){
	objs+=ds_list_find_value(Flag_Get(FLAG_TYPE.TEMP,FLAG_TEMP.INTERACTS_OBJ_LOCAL_LIST,0),i);
}
for(var i=real(room)*100;i<instance_number(char_npc)+real(room)*100;i++){
	npcs+=ds_list_find_value(Flag_Get(FLAG_TYPE.TEMP,FLAG_TEMP.INTERACTS_NPC_LOCAL_LIST,0),i);
}
var calls=ds_list_find_value(Flag_Get(FLAG_TYPE.TEMP,FLAG_TEMP.CALLS_LOCAL_LIST,0),real(room)*2);
		calls+=ds_list_find_value(Flag_Get(FLAG_TYPE.TEMP,FLAG_TEMP.CALLS_LOCAL_LIST,0),real(room)*2+1);
var color="{color_text `white`}";
_list_finished=0;
if(npcs>=Flag_Get(FLAG_TYPE.TEMP,FLAG_TEMP.INTERACTS_NPC_LOCAL_MAX,0)&&objs>=Flag_Get(FLAG_TYPE.TEMP,FLAG_TEMP.INTERACTS_OBJ_LOCAL_MAX,0)&&calls>=2){
	color="{color_text `yellow`}";
	_list_finished=1;
}
_inst_menu=instance_create_depth(32+6+46,168+6+14,0,text_typer);
_inst_menu.text=_prefix+"{space_y 2}"+Lang_GetString("ui.menu.phone")+"&"+color+Lang_GetString("ui.menu.list");

audio_play_sound(snd_menu_switch,0,false);
_can_cancel=false
alarm[0]=1
world.alarm[0] = 1
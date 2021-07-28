if(_menu==1){
	if(!instance_exists(_inst_item)){
		_inst_item=instance_create_depth(188+6+38,52+6+22,0,text_typer);
		_inst_item.text=_prefix;
		
		var proc=0;
		repeat(Item_GetNumber()){
			_inst_item.text+=Item_GetName(Item_Get(proc))+"&";
			proc+=1;
		}
	}
	if(!instance_exists(_inst_item_use)){
		_inst_item_use=instance_create_depth(188+6+38,52+6+302,0,text_typer);
		_inst_item_use.text=_prefix+Lang_GetString("ui.menu.item.use");
	}
	if(!instance_exists(_inst_item_info)){
		_inst_item_info=instance_create_depth(188+6+134,52+6+302,0,text_typer);
		_inst_item_info.text=_prefix+Lang_GetString("ui.menu.item.info");
	}
	if(!instance_exists(_inst_item_drop)){
		_inst_item_drop=instance_create_depth(188+6+248,52+6+302,0,text_typer);
		_inst_item_drop.text=_prefix+Lang_GetString("ui.menu.item.drop");
	}
}else{
	if(_menu!=2){
		if(instance_exists(_inst_item)){
			instance_destroy(_inst_item);
		}
		if(instance_exists(_inst_item_use)){
			instance_destroy(_inst_item_use);
		}
		if(instance_exists(_inst_item_info)){
			instance_destroy(_inst_item_info);
		}
		if(instance_exists(_inst_item_drop)){
			instance_destroy(_inst_item_drop);
		}
	}
}

if(_menu==3){
	if(!instance_exists(_inst_list_0)){
		_inst_list_0=instance_create_depth(188+6+22,52+6+26,0,text_typer);
		if(_list_finished==1){
			_inst_list_0.text=_prefix+"{color_text `yellow`}TO-DO LIST (ROOM COMPLETE!)&{color_text `gray_light`}"+Player_GetRoomName(room);
		}else if(_list_finished==2){
			_inst_list_0.text=_prefix+"{color_text `yellow`}TO-DO LIST (FULLY COMPLETE!)&{color_text `gray_light`}"+Player_GetRoomName(room);
		}else{
			_inst_list_0.text=_prefix+"TO-DO LIST&{color_text `gray_light`}"+Player_GetRoomName(room);
		}
	}
	if(!instance_exists(_inst_list_1)){
		var objs = 0
		var npcs = 0
		for(var i=real(room)*100;i<instance_number(char_interact)+real(room)*100;i++){
			objs += ds_list_find_value(Flag_Get(FLAG_TYPE.TEMP,FLAG_TEMP.INTERACTS_OBJ_LOCAL_LIST,0),i)
		}
		for(var i=real(room)*100;i<instance_number(char_npc)+real(room)*100;i++){
			npcs += ds_list_find_value(Flag_Get(FLAG_TYPE.TEMP,FLAG_TEMP.INTERACTS_NPC_LOCAL_LIST,0),i)
		}
		_inst_list_1=instance_create_depth(188+6+22,52+6+126,0,text_typer);
		var color = "{color_text `gray`}"
		var color2 = "{color_text `gray_dark`}"
		if(npcs>=1){
			color = "{color_text `white`}"
			color2 = "{color_text `gray_light`}"
		}
		if(npcs>=Flag_Get(FLAG_TYPE.TEMP,FLAG_TEMP.INTERACTS_NPC_LOCAL_MAX,0)){
			color = "{color_text `yellow`}"
			color2 = "{color_text `yellow`}"
		}
		_inst_list_1.text=_prefix+color+"Talk with the locals&"+color2+"("+string(npcs)+"/"+string(Flag_Get(FLAG_TYPE.TEMP,FLAG_TEMP.INTERACTS_NPC_LOCAL_MAX,0))+")&";
		color = "{color_text `gray`}"
		color2 = "{color_text `gray_dark`}"
		if(objs>=1){
			color = "{color_text `white`}"
			color2 = "{color_text `gray_light`}"
		}
		if(objs>=Flag_Get(FLAG_TYPE.TEMP,FLAG_TEMP.INTERACTS_OBJ_LOCAL_MAX,0)){
			color = "{color_text `yellow`}"
			color2 = "{color_text `yellow`}"
		}
		_inst_list_1.text+=color+"Inspect every object&"+color2+"("+string(objs)+"/"+string(Flag_Get(FLAG_TYPE.TEMP,FLAG_TEMP.INTERACTS_OBJ_LOCAL_MAX,0))+")&";
		color = "{color_text `gray`}"
		color2 = "{color_text `gray_dark`}"
		_inst_list_1.text+=color+"Chat with your friends&"+color2+"(0/2)&&";
		color = "{color_text `white`}"
		_inst_list_1.text+=color+"TOTAL PROGRESS: 0%";
	}
}else{
	if(instance_exists(_inst_list_0)){
		instance_destroy(_inst_list_0);
	}
	if(instance_exists(_inst_list_1)){
		instance_destroy(_inst_list_1);
	}
}

if(_menu==4){
	if(!instance_exists(_inst_phone)){
		_inst_phone=instance_create_depth(188+6+38,52+6+22,0,text_typer);
		_inst_phone.text=_prefix;
		
		var proc=0;
		repeat(Phone_GetNumber()){
			_inst_phone.text+=Phone_GetName(Phone_Get(proc))+"&";
			proc+=1;
		}
	}
}else{
	if(instance_exists(_inst_phone)){
		instance_destroy(_inst_phone);
	}
}
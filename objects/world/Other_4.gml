Flag_Set(FLAG_TYPE.STATIC,FLAG_STATIC.ROOM,room);

room_persistent=false;
Flag_Set(FLAG_TYPE.TEMP,FLAG_TEMP.INTERACTS_OBJ_LOCAL_MAX,instance_number(char_interact));
Flag_Set(FLAG_TYPE.TEMP,FLAG_TEMP.INTERACTS_NPC_LOCAL_MAX,instance_number(char_npc));
for(var i=real(room)*100;i<instance_number(char_interact)+real(room)*100;i++){
	if ds_list_find_value(Flag_Get(FLAG_TYPE.TEMP,FLAG_TEMP.INTERACTS_OBJ_LOCAL_LIST,0),i) != 1
	{
		ds_list_set(Flag_Get(FLAG_TYPE.TEMP,FLAG_TEMP.INTERACTS_OBJ_LOCAL_LIST,0),i,0)
	}
}
for(var i=real(room)*100;i<instance_number(char_npc)+real(room)*100;i++){
	if ds_list_find_value(Flag_Get(FLAG_TYPE.TEMP,FLAG_TEMP.INTERACTS_NPC_LOCAL_LIST,0),i) != 1
	{
		ds_list_set(Flag_Get(FLAG_TYPE.TEMP,FLAG_TEMP.INTERACTS_NPC_LOCAL_LIST,0),i,0)
	}
}
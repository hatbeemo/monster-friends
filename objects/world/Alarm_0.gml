for(var i=real(room)*100;i<instance_number(char_interact)+real(room)*100;i++){
	var obj = instance_find(char_interact,i-real(room)*100)
	if obj.interacted >= 1
	{
		ds_list_set(Flag_Get(FLAG_TYPE.TEMP,FLAG_TEMP.INTERACTS_OBJ_LOCAL_LIST,0),i,1)
	}
}
for(var i=real(room)*100;i<instance_number(char_npc)+real(room)*100;i++){
	var npc = instance_find(char_npc,i-real(room)*100)
	if npc.interacted >= 1
	{
		ds_list_set(Flag_Get(FLAG_TYPE.TEMP,FLAG_TEMP.INTERACTS_NPC_LOCAL_LIST,0),i,1)
	}
}
alarm[0] = 60
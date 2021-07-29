///@desc Call
ds_list_set(Flag_Get(FLAG_TYPE.TEMP,FLAG_TEMP.CALLS_LOCAL_LIST,0),real(room)*2,1)
Flag_Set(FLAG_TYPE.TEMP,FLAG_TEMP.CALLS_GLOBAL,Flag_Get(FLAG_TYPE.TEMP,FLAG_TEMP.CALLS_GLOBAL,0)+1)
audio_play_sound(snd_phone_call,0,false);
text="* Dialing...{pause}{clear}";
text+="* ...{pause}{clear}";
text+="* Nobody picked up.";
Dialog_Add(text);
Dialog_Start();

event_inherited();
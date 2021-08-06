///@desc Anim
Flag_Set(FLAG_TYPE.TEMP,FLAG_TEMP.WHIMSIE_PASSIVE_ACTIVE,2);
audio_play_sound(snd_special_obtain,0,false)
battle_ui.incoming_color=GOLD_COLOR
Anim_Create(battle_ui,"incoming_y",ANIM_TWEEN.SINE,ANIM_EASE.OUT,80,-100,30,0)
Battle_SetDialog("{pause}{end}")
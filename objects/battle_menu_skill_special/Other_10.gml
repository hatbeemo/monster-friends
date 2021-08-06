///@desc Anim
audio_play_sound(snd_special_obtain,0,false)
battle_ui.incoming_color=GOLD_COLOR
Anim_Create(battle_ui,"incoming_y",ANIM_TWEEN.SINE,ANIM_EASE.OUT,80,-100,30,0)
Battle_SetDialog("{pause}{end}")
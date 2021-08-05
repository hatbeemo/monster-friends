///@desc Turn Start
attacking=true;
_special_fx=1;
alarm[0] = 160
Anim_Create(battle_ui,"incoming_y",ANIM_TWEEN.SINE,ANIM_EASE.IN,battle_ui.incoming_y,100,25,0)
Battle_SetDialog("{sleep 999}");
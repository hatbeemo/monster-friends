///@desc Turn Start
event_inherited();
var ap = Flag_Get(FLAG_TYPE.TEMP,FLAG_TEMP.ENEMY_AP,0)
Flag_Set(FLAG_TYPE.TEMP,FLAG_TEMP.ENEMY_AP,ap-(2+powerboost))
Battle_SetDialog("{sleep 999}");
if(display_ap != Flag_Get(FLAG_TYPE.STATIC,FLAG_STATIC.AP,0)){
	if(display_ap < Flag_Get(FLAG_TYPE.STATIC,FLAG_STATIC.AP,0)){
		display_ap += 1
	}
	if(display_ap > Flag_Get(FLAG_TYPE.STATIC,FLAG_STATIC.AP,0)){
		display_ap -= 1
	}
}
if(display_enemy_ap != Flag_Get(FLAG_TYPE.TEMP,FLAG_TEMP.ENEMY_AP,0)){
	if(display_enemy_ap < Flag_Get(FLAG_TYPE.TEMP,FLAG_TEMP.ENEMY_AP,0)){
		display_enemy_ap += 1
	}
	if(display_enemy_ap > Flag_Get(FLAG_TYPE.TEMP,FLAG_TEMP.ENEMY_AP,0)){
		display_enemy_ap -= 1
	}
}
alarm[0]=10;
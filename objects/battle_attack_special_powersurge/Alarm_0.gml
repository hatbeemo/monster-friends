attacking=false
Flag_Set(FLAG_TYPE.TEMP,FLAG_TEMP.ENEMY_AP,Flag_Get(FLAG_TYPE.TEMP,FLAG_TEMP.ENEMY_AP_MAX,10))
Flag_Set(FLAG_TYPE.TEMP,FLAG_TEMP.ENEMY_SP,0)
var has_vulnerable=0;
with(battle_enemy_gospel){
	var proc=0;
	if(enemy_ailments!=-1){
		repeat(array_length(enemy_ailments)){
			if(enemy_ailments[proc]==1){
				has_vulnerable=1
				enemy_ailment_numbers[proc]+=1;
			}
			proc+=1
		}
	}
}
if(!has_vulnerable){
	if(battle_enemy_gospel.enemy_ailments==-1){
		battle_enemy_gospel.enemy_ailments=[1]
	}else{
		array_push(battle_enemy_gospel.enemy_ailments,1)
	}
	if(battle_enemy_gospel.enemy_ailment_numbers==-1){
		battle_enemy_gospel.enemy_ailment_numbers=[1]
	}else{
		array_push(battle_enemy_gospel.enemy_ailment_numbers,1)
	}
}
Battle_SetDialog("* Something revs up from within&  the AUTORIEL's body!{pause}{end}");
_done=1;
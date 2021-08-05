///@desc Damage
event_inherited();
with(Battle_ConvertMenuChoiceEnemyToEnemySlot(Battle_GetMenuChoiceEnemy())){
	var proc=0;
	var has_ailment=0;
	if(enemy_ailments!=-1){
		repeat(array_length(enemy_ailments)){
			if(enemy_ailments[proc]==1){
				enemy_ailment_numbers[proc]+=1;
				has_ailment=1
			}
			proc+=1
		}
	}
	if(!has_ailment){
		if(enemy_ailments==-1){
			enemy_ailments=[1]
		}else{
			array_push(enemy_ailments,1)
		}
		var proc=0
		repeat(array_length(enemy_ailments)){
			if(enemy_ailments[proc]==1){
				enemy_ailment_numbers[proc]=1;
				has_ailment=1
			}
			proc+=1
		}
	}
}
Player_EarnDamageSp(damage);
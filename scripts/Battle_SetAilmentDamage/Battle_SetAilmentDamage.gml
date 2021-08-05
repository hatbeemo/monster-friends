///@arg damage
function Battle_SetAilmentDamage() {
	var DAMAGE=argument[0];

	if(DAMAGE>=-1){
		battle._ailment_damage=DAMAGE;
		return true;
	}else{
		return false;
	}


}

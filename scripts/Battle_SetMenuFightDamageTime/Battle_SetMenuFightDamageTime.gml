///@arg time
function Battle_SetMenuFightDamageTime() {
	var TIME=argument[0];

	var MENU=Battle_GetMenu();

	if((MENU==BATTLE_MENU.SKILL_EVENT||MENU==BATTLE_MENU.SKILL_DAMAGE||MENU==BATTLE_MENU.BAG_EVENT) && TIME>=-1){
		battle._menu_fight_damage_time=TIME;
		return true;
	}else{
		return false;
	}


}

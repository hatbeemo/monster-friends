///@arg time
function Battle_SetMenuFightAnimTime() {
	var TIME=argument[0];

	var MENU=Battle_GetMenu();

	if((MENU==BATTLE_MENU.SKILL_EVENT) && TIME>=-1){
		battle._menu_fight_anim_time=TIME;
		return true;
	}else{
		return false;
	}


}

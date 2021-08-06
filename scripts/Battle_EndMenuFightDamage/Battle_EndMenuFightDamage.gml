function Battle_EndMenuFightDamage() {
	if(Battle_GetMenu()==BATTLE_MENU.SKILL_DAMAGE||Battle_GetMenu()==BATTLE_MENU.SKILL_DAMAGE_EXTRA){
		Battle_EndMenu()	
		return true;
	}else{
		return false;
	}


}

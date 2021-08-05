function Battle_EndMenu() {
	if(Battle_GetState()==BATTLE_STATE.MENU){
		Battle_SetMenu(-1,false);
	
		var BUTTON=Battle_GetMenuChoiceButton();
	
		//使用物品
		if(BUTTON==BATTLE_MENU_CHOICE_BUTTON.BAG){
			battle._menu_item_used_last=Item_Get(Battle_GetMenuChoiceItem());
			Item_CallEvent(Item_Get(Battle_GetMenuChoiceItem()),ITEM_EVENT.USE,Battle_GetMenuChoiceItem());
		}
	
		if(BUTTON==BATTLE_MENU_CHOICE_BUTTON.SKILL){
			if(instance_exists(battle_menu_fight)){
				with(battle_menu_fight){
					event_user(BATTLE_MENU_FIGHT_EVENT.END);
				}
			}
		}
	
		//调用事件
		Battle_CallEnemyEvent(BATTLE_ENEMY_EVENT.MENU_END);
		Battle_GotoNextState();
		return true;
	}else{
		return false;
	}


}

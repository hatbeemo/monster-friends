function Battle_EndTurnPreparation() {
	if(Battle_GetState()==BATTLE_STATE.ATTACK_PREPARATION){
		Battle_CallEnemyEvent(BATTLE_ENEMY_EVENT.ATTACK_PREPARATION_END);
		if(instance_exists(battle_attack)){
			with(battle_attack){
				event_user(BATTLE_TURN_EVENT.ATTACK_PREPARATION_END);
			}
		}
		Battle_GotoNextState();
		return true;
	}else{
		return false;
	}


}

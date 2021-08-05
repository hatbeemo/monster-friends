///@arg state
function Battle_SetState() {
	var STATE=argument[0];

	battle._state=STATE;

	//菜单
	if(STATE==BATTLE_STATE.MENU){
		if(Player_GetPartyHp(0)<=0){
			Flag_Set(FLAG_TYPE.TEMP,FLAG_TEMP.MEMBER_ACTIVE,1)
		}else{
			Flag_Set(FLAG_TYPE.TEMP,FLAG_TEMP.MEMBER_ACTIVE,0)
		}
		
		Battle_SetNextState(BATTLE_STATE.DIALOG);
	
		Battle_SetMenuChoiceEnemy(0,false);
		Battle_SetMenuChoiceAction(0,false);
		Battle_SetMenu(BATTLE_MENU.BUTTON,false);
	
		Battle_CallEnemyEvent(BATTLE_ENEMY_EVENT.MENU_START);
	}
	
	if(STATE==BATTLE_STATE.SKILL_EVENT_TRIGGER){
		Battle_SetMenu(battle.turn_event[battle.battle_turn_order[battle.turn_progress]]);
	}
	//对话
	if(STATE==BATTLE_STATE.DIALOG){
		Battle_SetNextState(BATTLE_STATE.AILMENT_EFFECTS);
	
		Battle_CallEnemyEvent(BATTLE_ENEMY_EVENT.DIALOG_START);
	}

	//回合准备
	if(STATE==BATTLE_STATE.ATTACK_PREPARATION){
		Battle_SetNextState(BATTLE_STATE.ATTACK_PHASE);
	
		Battle_CallEnemyEvent(BATTLE_ENEMY_EVENT.ATTACK_PREPARATION_START,battle.battle_turn_order[battle.turn_progress]-2);
	
		if(instance_exists(battle_attack)){
			with(battle_attack){
				event_user(BATTLE_TURN_EVENT.ATTACK_PREPARATION_START);
			}
		}
		Anim_Create(battle_ui,"incoming_y",ANIM_TWEEN.SINE,ANIM_EASE.OUT,80,-100,30,0)
		if(instance_exists(battle_enemy_autoriel)&&!instance_exists(battle_attack_special)){
			Anim_Create(battle_ui,"incoming_y2",ANIM_TWEEN.SINE,ANIM_EASE.OUT,80,-100,30,0)	
		}else{
			battle_ui.incoming_y2=80;
		}
		Battle_SetTurnTime(Battle_GetTurnInfo(BATTLE_TURN.TIME,0));
	}

	//回合内
	if(STATE==BATTLE_STATE.ATTACK_PHASE){
		if(instance_exists(battle_attack_special)){
		}else if(instance_exists(battle_enemy_autoriel)){
			Battle_SetNextState(BATTLE_STATE.SECOND_ATTACK_PHASE);
			Battle_CallEnemyEvent(BATTLE_ENEMY_EVENT.TURN_START,Battle_ConvertMenuChoiceEnemyToEnemySlot(battle.battle_turn_order[battle.turn_progress-1]-2));
		}else{
			battle.turn_progress+=1;
			if(battle.turn_progress>=array_length(battle.battle_turn_order)){
				Battle_SetState(BATTLE_STATE.AILMENT_EFFECTS_AFTER);
			}else if(battle.battle_turn_order[battle.turn_progress]==0||battle.battle_turn_order[battle.turn_progress]==1){
				Battle_SetNextState(BATTLE_STATE.SKILL_EVENT_TRIGGER)
				Battle_CallEnemyEvent(BATTLE_ENEMY_EVENT.TURN_START,Battle_ConvertMenuChoiceEnemyToEnemySlot(battle.battle_turn_order[battle.turn_progress-1]-2));
			}else{
				Battle_SetNextState(BATTLE_STATE.ATTACK_PREPARATION);
				Battle_CallEnemyEvent(BATTLE_ENEMY_EVENT.TURN_START,Battle_ConvertMenuChoiceEnemyToEnemySlot(battle.battle_turn_order[battle.turn_progress-1]-2));
			}
		}
		if(instance_exists(battle_attack)){
			with(battle_attack){
				if(instance_exists(battle_enemy_autoriel)&&attack_priority==0){
					event_user(BATTLE_TURN_EVENT.TURN_START);
				}else if(!instance_exists(battle_enemy_autoriel)||battle.battle_turn_order[battle.turn_progress]!=3){
					event_user(BATTLE_TURN_EVENT.TURN_START);	
				}
			}
		}
	}
	
	if(STATE==BATTLE_STATE.SECOND_ATTACK_PHASE){
		battle.turn_progress+=1;
		if(battle.turn_progress>=array_length(battle.battle_turn_order)){
			Battle_SetState(BATTLE_STATE.AILMENT_EFFECTS_AFTER);
		}else if(battle.battle_turn_order[battle.turn_progress]==0||battle.battle_turn_order[battle.turn_progress]==1){
			Battle_SetNextState(BATTLE_STATE.SKILL_EVENT_TRIGGER)
		}else{
			Battle_SetNextState(BATTLE_STATE.ATTACK_PREPARATION);
		}
		if(instance_exists(battle_attack)){
			with(battle_attack){
				if(attack_priority==1){
					event_user(BATTLE_TURN_EVENT.TURN_START);
				}
			}
		}
	}

	//面版重置
	if(STATE==BATTLE_STATE.AILMENT_EFFECTS){
		var proc=battle._ailment_target;
		var proc2=battle._ailment_check;
		var number=1;
		battle._has_ailment=0;
		if(instance_exists(Battle_GetEnemy(Battle_ConvertMenuChoiceEnemyToEnemySlot(proc)))){
			with(Battle_GetEnemy(Battle_ConvertMenuChoiceEnemyToEnemySlot(proc))){
				if(enemy_ailments!=-1){
					battle._ailment_max=array_length(enemy_ailments)
					if(enemy_ailments[proc2]>=1){
						battle._has_ailment=enemy_ailments[proc2]
						if(enemy_ailments[proc2]!=1){
							var number=enemy_ailment_numbers[proc2]
							enemy_ailment_numbers[proc2]-=1;
							if(enemy_ailment_numbers[proc2]<=0){
								battle._has_ailment=-enemy_ailments[proc2]
								array_delete(enemy_ailments,proc2,1)
								array_push(enemy_ailments,-1)
								array_delete(enemy_ailment_numbers,proc2,1)
								array_push(enemy_ailment_numbers,-1)
							}
						}
					}
				}
			}
		}
		battle._ailment_check+=1;
		Battle_SetNextState(BATTLE_STATE.AILMENT_EFFECTS);
		if(battle._ailment_check>=battle._ailment_max){
			battle._ailment_check=0;
			battle._ailment_target+=1;
			if(battle._ailment_target>=Battle_GetEnemyNumber()){
				if(battle.turn_progress>=array_length(battle.battle_turn_order)){
					Battle_SetNextState(BATTLE_STATE.AILMENT_EFFECTS_AFTER);
				}else{
					Battle_SetNextState(BATTLE_STATE.ATTACK_PREPARATION);
				}
			}
		}
		if(battle._has_ailment==2){
			Battle_SetAilmentDamage(number);
			with(Battle_GetEnemy(Battle_ConvertMenuChoiceEnemyToEnemySlot(proc))){
				event_user(14)
				new_color=RED_COLOR
				color_timer=1.5
			}
			if(instance_exists(battle_enemy_autoriel)&&Battle_GetEnemyName(Battle_ConvertMenuChoiceEnemyToEnemySlot(proc))=="AUTORIEL"){
				Battle_SetDialog("* The AUTORIEL took {color_text `specred`}"+string(number)+"{color_text `white`} damage from&  its burns!{pause}{end}")
			}else{
				Battle_SetDialog("* "+Battle_GetEnemyName(Battle_ConvertMenuChoiceEnemyToEnemySlot(proc))+" took {color_text `specred`}"+string(number)+"{color_text `white`} damage from&  their burns!{pause}{end}")
			}
		}else if(battle._has_ailment=-2){
			Battle_SetAilmentDamage(number);
			with(Battle_GetEnemy(Battle_ConvertMenuChoiceEnemyToEnemySlot(proc))){
				event_user(14)
				new_color=RED_COLOR
				color_timer=1.5
			}
			if(instance_exists(battle_enemy_autoriel)&&Battle_GetEnemyName(Battle_ConvertMenuChoiceEnemyToEnemySlot(proc))=="AUTORIEL"){
				Battle_SetDialog("* The AUTORIEL took {color_text `specred`}"+string(number)+"{color_text `white`} damage from&  its burns!{pause}{clear}* The AUTORIEL's burns went away!{pause}{end}")
			}else{
				Battle_SetDialog("* "+Battle_GetEnemyName(Battle_ConvertMenuChoiceEnemyToEnemySlot(proc))+" took {color_text `specred`}"+string(number)+"{color_text `white`} damage from&  their burns!&* "+Battle_GetEnemyName(Battle_ConvertMenuChoiceEnemyToEnemySlot(proc))+"'s burns went away!{pause}{end}")
			}
		}
	}
	
	if(STATE==BATTLE_STATE.AILMENT_EFFECTS_AFTER){
		Anim_Destroy(battle_ui,"incoming_y")
		Anim_Destroy(battle_ui,"incoming_y2")
		battle_ui.party_type[0]=5+battle_ui.party_member[0];
		battle_ui.party_type[1]=5+battle_ui.party_member[1];
		Battle_CallEnemyEvent(BATTLE_ENEMY_EVENT.ATTACK_RESETTING_START);
		Flag_Set(FLAG_TYPE.STATIC,FLAG_STATIC.AP,Flag_Get(FLAG_TYPE.STATIC,FLAG_STATIC.AP,0)+1)
		Flag_Set(FLAG_TYPE.TEMP,FLAG_TEMP.ENEMY_AP,Flag_Get(FLAG_TYPE.TEMP,FLAG_TEMP.ENEMY_AP,0)+1)
		battle_ui.alarm[0]=10;
		Battle_SetNextState(BATTLE_STATE.MENU);
		Battle_CallEnemyEvent(BATTLE_ENEMY_EVENT.ATTACK_RESETTING_START);
		Battle_SetDialog("{sleep 1}{end}");
		if(instance_exists(battle_skill_bomb)){
			with(battle_skill_bomb){
				if(fuse>0){
					event_user(0)
				}
			}
		}
	}
	return true;


}

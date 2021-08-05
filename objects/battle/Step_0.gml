//菜单
if(Battle_GetAp()>10){
	Battle_SetAp(10)
}
if(Battle_GetSp()>12){
	Battle_SetSp(12)
}
if(_state==BATTLE_STATE.MENU){
	//按钮
	if(_menu==BATTLE_MENU.BUTTON){
		//左/右
		if(Input_IsPressed(INPUT.LEFT)){
			var button=_menu_choice_button[Flag_Get(FLAG_TYPE.TEMP,FLAG_TEMP.MEMBER_ACTIVE,0)];
			button-=1;
			if(button<0){
				button=3;
			}
			audio_play_sound(snd_menu_switch,0,false);
			Battle_SetMenuChoiceButton(button);
		}else if(Input_IsPressed(INPUT.RIGHT)){
			var button=_menu_choice_button[Flag_Get(FLAG_TYPE.TEMP,FLAG_TEMP.MEMBER_ACTIVE,0)];
			button+=1;
			if(button>3){
				button=0;
			}
			audio_play_sound(snd_menu_switch,0,false);
			Battle_SetMenuChoiceButton(button);
		}
		
		//确定
		if(Input_IsPressed(INPUT.CANCEL)){
			Battle_PrevMember();
		}else if(Input_IsPressed(INPUT.CONFIRM)){
			audio_play_sound(snd_menu_confirm,0,false);
			switch(_menu_choice_button[Flag_Get(FLAG_TYPE.TEMP,FLAG_TEMP.MEMBER_ACTIVE,0)]){
				case 0:
					Battle_SetMenu(BATTLE_MENU.SKILL_SELECT);
					break;
				case 1:
					Battle_SetMenu(BATTLE_MENU.CHECK_TARGET);
					break;
				case 2:
					if(Item_GetNumber()>0){
						Battle_SetMenu(BATTLE_MENU.BAG);
					}else{
						audio_stop_sound(snd_menu_confirm);
					}
					break;
				case 3:
					turn_event[Flag_Get(FLAG_TYPE.TEMP,FLAG_TEMP.MEMBER_ACTIVE,0)]=BATTLE_MENU.DEFEND;
					Battle_NextMember();
					break;
			}
		}
	}else
	
	//行动内容
	if(_menu==BATTLE_MENU.SKILL_SELECT){
		//上/下
		if(Input_IsPressed(INPUT.UP)){
			var action=_menu_choice_skill[Flag_Get(FLAG_TYPE.TEMP,FLAG_TEMP.MEMBER_ACTIVE,0)]-2;
			if(action>=0){
				audio_play_sound(snd_menu_switch,0,false);
				Battle_SetMenuChoiceAction(action);
				Battle_SetMenu(BATTLE_MENU.SKILL_SELECT);
			}
		}else if(Input_IsPressed(INPUT.DOWN)){
			var action=_menu_choice_skill[Flag_Get(FLAG_TYPE.TEMP,FLAG_TEMP.MEMBER_ACTIVE,0)]+2;
			if(action<ds_list_size(Flag_Get(FLAG_TYPE.STATIC,FLAG_STATIC.PARTY_MOVESETS+battle_ui.party_member[Flag_Get(FLAG_TYPE.TEMP,FLAG_TEMP.MEMBER_ACTIVE,0)],0))){
				audio_play_sound(snd_menu_switch,0,false);
				Battle_SetMenuChoiceAction(action);
				Battle_SetMenu(BATTLE_MENU.SKILL_SELECT);
			}
		}
		//左/右
		if(Input_IsPressed(INPUT.LEFT)){
			if(_menu_choice_skill[Flag_Get(FLAG_TYPE.TEMP,FLAG_TEMP.MEMBER_ACTIVE,0)]%2==1){
				var action=_menu_choice_skill[Flag_Get(FLAG_TYPE.TEMP,FLAG_TEMP.MEMBER_ACTIVE,0)]-1;
				if(action>=0){
					audio_play_sound(snd_menu_switch,0,false);
					Battle_SetMenuChoiceAction(action);
					Battle_SetMenu(BATTLE_MENU.SKILL_SELECT);
				}
			}
		}else if(Input_IsPressed(INPUT.RIGHT)){
			if(_menu_choice_skill[Flag_Get(FLAG_TYPE.TEMP,FLAG_TEMP.MEMBER_ACTIVE,0)]%2==0){
				var action=_menu_choice_skill[Flag_Get(FLAG_TYPE.TEMP,FLAG_TEMP.MEMBER_ACTIVE,0)]+1;
				if(action<ds_list_size(Flag_Get(FLAG_TYPE.STATIC,FLAG_STATIC.PARTY_MOVESETS+battle_ui.party_member[Flag_Get(FLAG_TYPE.TEMP,FLAG_TEMP.MEMBER_ACTIVE,0)],0))){
					audio_play_sound(snd_menu_switch,0,false);
					Battle_SetMenuChoiceAction(action);
					Battle_SetMenu(BATTLE_MENU.SKILL_SELECT);
				}
			}
		}
		
		//灵魂位置
		battle_soul.x=55+256*(_menu_choice_skill[Flag_Get(FLAG_TYPE.TEMP,FLAG_TEMP.MEMBER_ACTIVE,0)]%2);
		battle_soul.y=354+36+32*floor(_menu_choice_skill[Flag_Get(FLAG_TYPE.TEMP,FLAG_TEMP.MEMBER_ACTIVE,0)]/2);
		
		//返回/确定
		if(Input_IsPressed(INPUT.CANCEL)){
			audio_play_sound(snd_menu_switch,0,false);
			Battle_SetMenu(BATTLE_MENU.BUTTON);
		}else if(Input_IsPressed(INPUT.CONFIRM)){
			if(battle_ui.party_member[Flag_Get(FLAG_TYPE.TEMP,FLAG_TEMP.MEMBER_ACTIVE,0)]==1&&Battle_IsSkillDealsDmg(ds_list_find_value(Flag_Get(FLAG_TYPE.STATIC,FLAG_STATIC.PARTY_MOVESETS+battle_ui.party_member[Flag_Get(FLAG_TYPE.TEMP,FLAG_TEMP.MEMBER_ACTIVE,0)]),Battle_GetMenuChoiceAction()))){
				if(Battle_GetAp()>=Battle_GetSkillApCost(ds_list_find_value(Flag_Get(FLAG_TYPE.STATIC,FLAG_STATIC.PARTY_MOVESETS+battle_ui.party_member[Flag_Get(FLAG_TYPE.TEMP,FLAG_TEMP.MEMBER_ACTIVE,0)]),Battle_GetMenuChoiceAction()))){
					audio_play_sound(snd_menu_confirm,0,false);
					Flag_Set(FLAG_TYPE.TEMP,FLAG_TEMP.GOSPEL_PASSIVE_BOOST,0);
					Battle_SetMenuChoiceSkillPower(0);
					Battle_SetMenu(BATTLE_MENU.SKILL_POWER);
				}else{
					audio_play_sound(snd_menu_buzzer,0,false);	
				}
			}else if(battle_ui.party_member[Flag_Get(FLAG_TYPE.TEMP,FLAG_TEMP.MEMBER_ACTIVE,0)]==0&& Battle_IsSkillBomb(ds_list_find_value(Flag_Get(FLAG_TYPE.STATIC,FLAG_STATIC.PARTY_MOVESETS+battle_ui.party_member[Flag_Get(FLAG_TYPE.TEMP,FLAG_TEMP.MEMBER_ACTIVE,0)]),Battle_GetMenuChoiceAction()))){
				if(Battle_GetAp()>=Battle_GetSkillApCost(ds_list_find_value(Flag_Get(FLAG_TYPE.STATIC,FLAG_STATIC.PARTY_MOVESETS+battle_ui.party_member[Flag_Get(FLAG_TYPE.TEMP,FLAG_TEMP.MEMBER_ACTIVE,0)]),Battle_GetMenuChoiceAction()))){
					audio_play_sound(snd_menu_confirm,0,false);
					Flag_Set(FLAG_TYPE.TEMP,FLAG_TEMP.WHIMSIE_BOMB_FUSE,1);
					Battle_SetMenuChoiceSkillPower(0);
					Battle_SetMenu(BATTLE_MENU.SKILL_FUSE);
				}else{
					audio_play_sound(snd_menu_buzzer,0,false);	
				}
			}else{
				if(Battle_GetAp()>=Battle_GetSkillApCost(ds_list_find_value(Flag_Get(FLAG_TYPE.STATIC,FLAG_STATIC.PARTY_MOVESETS+battle_ui.party_member[Flag_Get(FLAG_TYPE.TEMP,FLAG_TEMP.MEMBER_ACTIVE,0)]),Battle_GetMenuChoiceAction()))){
					audio_play_sound(snd_menu_confirm,0,false);
					if(Battle_GetSkillTarget(ds_list_find_value(Flag_Get(FLAG_TYPE.STATIC,FLAG_STATIC.PARTY_MOVESETS+battle_ui.party_member[Flag_Get(FLAG_TYPE.TEMP,FLAG_TEMP.MEMBER_ACTIVE,0)]),Battle_GetMenuChoiceAction()))!="ALL"){
						Battle_SetMenu(BATTLE_MENU.SKILL_TARGET);
					}else{
						battle_ui.hint_active=false;
						Battle_SetHintDialog("",true);
						turn_event[Flag_Get(FLAG_TYPE.TEMP,FLAG_TEMP.MEMBER_ACTIVE,0)]=BATTLE_MENU.SKILL_EVENT;
						if(Battle_IsSkillDealsDmg(ds_list_find_value(Flag_Get(FLAG_TYPE.STATIC,FLAG_STATIC.PARTY_MOVESETS+battle_ui.party_member[Flag_Get(FLAG_TYPE.TEMP,FLAG_TEMP.MEMBER_ACTIVE,0)]),Battle_GetMenuChoiceAction()))){
							battle_ui.party_type[Flag_Get(FLAG_TYPE.TEMP,FLAG_TEMP.MEMBER_ACTIVE,0)]=2;
						}else{
							battle_ui.party_type[Flag_Get(FLAG_TYPE.TEMP,FLAG_TEMP.MEMBER_ACTIVE,0)]=0;
						}
						Battle_NextMember();
					}
				}else{
					audio_play_sound(snd_menu_buzzer,0,false);	
				}
			}
		}
	}else
	
	if(_menu==BATTLE_MENU.SKILL_POWER){
		//左/右
		if(Input_IsPressed(INPUT.LEFT)){
			var action=_menu_choice_skill_power[Flag_Get(FLAG_TYPE.TEMP,FLAG_TEMP.MEMBER_ACTIVE,0)]-1;
			if(action>=0){
				audio_play_sound(snd_menu_switch,0,false);
				Battle_SetMenuChoiceSkillPower(action);
				Flag_Set(FLAG_TYPE.TEMP,FLAG_TEMP.GOSPEL_PASSIVE_BOOST,Battle_GetMenuChoiceSkillPower());
				Battle_SetMenu(BATTLE_MENU.SKILL_POWER);
			}
		}else if(Input_IsPressed(INPUT.RIGHT)){
			var action=_menu_choice_skill_power[Flag_Get(FLAG_TYPE.TEMP,FLAG_TEMP.MEMBER_ACTIVE,0)]+1;
			if(action<=3){
				audio_play_sound(snd_menu_switch,0,false);
				Battle_SetMenuChoiceSkillPower(action);
				Flag_Set(FLAG_TYPE.TEMP,FLAG_TEMP.GOSPEL_PASSIVE_BOOST,Battle_GetMenuChoiceSkillPower());
				Battle_SetMenu(BATTLE_MENU.SKILL_POWER);
			}
		}

		//返回/确定
		if(Input_IsPressed(INPUT.CANCEL)){
			Flag_Set(FLAG_TYPE.TEMP,FLAG_TEMP.GOSPEL_PASSIVE_BOOST,0);
			audio_play_sound(snd_menu_switch,0,false);
			Battle_SetMenu(BATTLE_MENU.SKILL_SELECT);
		}else if(Input_IsPressed(INPUT.CONFIRM)){
			if(Battle_GetAp()>=Battle_GetSkillApCost(ds_list_find_value(Flag_Get(FLAG_TYPE.STATIC,FLAG_STATIC.PARTY_MOVESETS+battle_ui.party_member[Flag_Get(FLAG_TYPE.TEMP,FLAG_TEMP.MEMBER_ACTIVE,0)]),Battle_GetMenuChoiceAction()))){
				audio_play_sound(snd_menu_confirm,0,false);
				if(Battle_GetSkillTarget(ds_list_find_value(Flag_Get(FLAG_TYPE.STATIC,FLAG_STATIC.PARTY_MOVESETS+battle_ui.party_member[Flag_Get(FLAG_TYPE.TEMP,FLAG_TEMP.MEMBER_ACTIVE,0)]),Battle_GetMenuChoiceAction()))!="ALL"){
					Battle_SetMenu(BATTLE_MENU.SKILL_TARGET);
				}else{
					battle_ui.hint_active=false;
					Battle_SetHintDialog("",true);
					turn_event[Flag_Get(FLAG_TYPE.TEMP,FLAG_TEMP.MEMBER_ACTIVE,0)]=BATTLE_MENU.SKILL_EVENT;
					if(Battle_IsSkillDealsDmg(ds_list_find_value(Flag_Get(FLAG_TYPE.STATIC,FLAG_STATIC.PARTY_MOVESETS+battle_ui.party_member[Flag_Get(FLAG_TYPE.TEMP,FLAG_TEMP.MEMBER_ACTIVE,0)]),Battle_GetMenuChoiceAction()))){
						battle_ui.party_type[Flag_Get(FLAG_TYPE.TEMP,FLAG_TEMP.MEMBER_ACTIVE,0)]=2;
					}else{
						battle_ui.party_type[Flag_Get(FLAG_TYPE.TEMP,FLAG_TEMP.MEMBER_ACTIVE,0)]=0;
					}
					Battle_NextMember();
				}
			}else{
				audio_play_sound(snd_menu_buzzer,0,false);	
			}
		}
	}else
	
	if(_menu==BATTLE_MENU.SKILL_FUSE){
		//左/右
		if(Input_IsPressed(INPUT.LEFT)){
			var action=_menu_choice_skill_power[Flag_Get(FLAG_TYPE.TEMP,FLAG_TEMP.MEMBER_ACTIVE,0)]-1;
			if(action>=0){
				audio_play_sound(snd_menu_switch,0,false);
				Battle_SetMenuChoiceSkillPower(action);
				Flag_Set(FLAG_TYPE.TEMP,FLAG_TEMP.WHIMSIE_BOMB_FUSE,Battle_GetMenuChoiceSkillPower()+1);
				Battle_SetMenu(BATTLE_MENU.SKILL_FUSE);
			}
		}else if(Input_IsPressed(INPUT.RIGHT)){
			var action=_menu_choice_skill_power[Flag_Get(FLAG_TYPE.TEMP,FLAG_TEMP.MEMBER_ACTIVE,0)]+1;
			if(action<=2){
				audio_play_sound(snd_menu_switch,0,false);
				Battle_SetMenuChoiceSkillPower(action);
				Flag_Set(FLAG_TYPE.TEMP,FLAG_TEMP.WHIMSIE_BOMB_FUSE,Battle_GetMenuChoiceSkillPower()+1);
				Battle_SetMenu(BATTLE_MENU.SKILL_FUSE);
			}
		}

		//返回/确定
		if(Input_IsPressed(INPUT.CANCEL)){
			Flag_Set(FLAG_TYPE.TEMP,FLAG_TEMP.WHIMSIE_BOMB_FUSE,1);
			audio_play_sound(snd_menu_switch,0,false);
			Battle_SetMenu(BATTLE_MENU.SKILL_SELECT);
		}else if(Input_IsPressed(INPUT.CONFIRM)){
			if(Battle_GetAp()>=Battle_GetSkillApCost(ds_list_find_value(Flag_Get(FLAG_TYPE.STATIC,FLAG_STATIC.PARTY_MOVESETS+battle_ui.party_member[Flag_Get(FLAG_TYPE.TEMP,FLAG_TEMP.MEMBER_ACTIVE,0)]),Battle_GetMenuChoiceAction()))){
				audio_play_sound(snd_menu_confirm,0,false);
				if(Battle_GetSkillTarget(ds_list_find_value(Flag_Get(FLAG_TYPE.STATIC,FLAG_STATIC.PARTY_MOVESETS+battle_ui.party_member[Flag_Get(FLAG_TYPE.TEMP,FLAG_TEMP.MEMBER_ACTIVE,0)]),Battle_GetMenuChoiceAction()))!="ALL"){
					Battle_SetMenu(BATTLE_MENU.SKILL_TARGET);
				}else{
					battle_ui.hint_active=false;
					Battle_SetHintDialog("",true);
					turn_event[Flag_Get(FLAG_TYPE.TEMP,FLAG_TEMP.MEMBER_ACTIVE,0)]=BATTLE_MENU.SKILL_EVENT;
					if(Battle_IsSkillDealsDmg(ds_list_find_value(Flag_Get(FLAG_TYPE.STATIC,FLAG_STATIC.PARTY_MOVESETS+battle_ui.party_member[Flag_Get(FLAG_TYPE.TEMP,FLAG_TEMP.MEMBER_ACTIVE,0)]),Battle_GetMenuChoiceAction()))){
						battle_ui.party_type[Flag_Get(FLAG_TYPE.TEMP,FLAG_TEMP.MEMBER_ACTIVE,0)]=2;
					}else{
						battle_ui.party_type[Flag_Get(FLAG_TYPE.TEMP,FLAG_TEMP.MEMBER_ACTIVE,0)]=0;
					}
					Battle_NextMember();
				}
			}else{
				audio_play_sound(snd_menu_buzzer,0,false);	
			}
		}
	}else
	//战斗目标
	if(_menu==BATTLE_MENU.SKILL_TARGET){
		//上/下
		if(Input_IsPressed(INPUT.UP)){
			var enemy=_menu_choice_enemy[Flag_Get(FLAG_TYPE.TEMP,FLAG_TEMP.MEMBER_ACTIVE,0)]-1;
			if(enemy>=0){
				audio_play_sound(snd_menu_switch,0,false);
				Battle_SetMenuChoiceEnemy(enemy);
			}
		}else if(Input_IsPressed(INPUT.DOWN)){
			var enemy=_menu_choice_enemy[Flag_Get(FLAG_TYPE.TEMP,FLAG_TEMP.MEMBER_ACTIVE,0)]+1;
			var number=Battle_GetEnemyNumber()
			if(Battle_GetSkillTarget(ds_list_find_value(Flag_Get(FLAG_TYPE.STATIC,FLAG_STATIC.PARTY_MOVESETS+battle_ui.party_member[Flag_Get(FLAG_TYPE.TEMP,FLAG_TEMP.MEMBER_ACTIVE,0)]),Battle_GetMenuChoiceAction()))=="PLAYER"){
				number=2
			}	
			if(enemy<number){
				audio_play_sound(snd_menu_switch,0,false);
				Battle_SetMenuChoiceEnemy(enemy);
			}
		}
		
		//灵魂位置
		battle_soul.x=55;
		battle_soul.y=354+36+32*_menu_choice_enemy[Flag_Get(FLAG_TYPE.TEMP,FLAG_TEMP.MEMBER_ACTIVE,0)];
		
		//返回
		if(Input_IsPressed(INPUT.CANCEL)){
			audio_play_sound(snd_menu_switch,0,false);
			Flag_Set(FLAG_TYPE.TEMP,FLAG_TEMP.GOSPEL_PASSIVE_BOOST,0);
			Battle_SetMenuChoiceSkillPower(0);
			Battle_SetMenu(BATTLE_MENU.SKILL_SELECT);
		}
		//确定
		if(Input_IsPressed(INPUT.CONFIRM)){
			audio_play_sound(snd_menu_confirm,0,false);
			turn_event[Flag_Get(FLAG_TYPE.TEMP,FLAG_TEMP.MEMBER_ACTIVE,0)]=BATTLE_MENU.SKILL_EVENT;
			if(Battle_IsSkillDealsDmg(ds_list_find_value(Flag_Get(FLAG_TYPE.STATIC,FLAG_STATIC.PARTY_MOVESETS+battle_ui.party_member[Flag_Get(FLAG_TYPE.TEMP,FLAG_TEMP.MEMBER_ACTIVE,0)]),Battle_GetMenuChoiceAction()))){
				battle_ui.party_type[Flag_Get(FLAG_TYPE.TEMP,FLAG_TEMP.MEMBER_ACTIVE,0)]=2;
			}else{
				battle_ui.party_type[Flag_Get(FLAG_TYPE.TEMP,FLAG_TEMP.MEMBER_ACTIVE,0)]=0;
			}
			Battle_NextMember();
		}
	}else
	
	//行动目标
	if(_menu==BATTLE_MENU.CHECK_TARGET){
		//上/下
		if(Input_IsPressed(INPUT.UP)){
			var enemy=_menu_choice_enemy[Flag_Get(FLAG_TYPE.TEMP,FLAG_TEMP.MEMBER_ACTIVE,0)]-1;
			if(enemy>=0){
				audio_play_sound(snd_menu_switch,0,false);
				Battle_SetMenuChoiceEnemy(enemy);
			}
		}else if(Input_IsPressed(INPUT.DOWN)){
			var enemy=_menu_choice_enemy[Flag_Get(FLAG_TYPE.TEMP,FLAG_TEMP.MEMBER_ACTIVE,0)]+1;
			if(enemy<Battle_GetEnemyNumber()){
				audio_play_sound(snd_menu_switch,0,false);
				Battle_SetMenuChoiceEnemy(enemy);
			}
		}
		
		//灵魂位置
		battle_soul.x=55;
		battle_soul.y=354+36+32*_menu_choice_enemy[Flag_Get(FLAG_TYPE.TEMP,FLAG_TEMP.MEMBER_ACTIVE,0)];
		
		//返回
		if(Input_IsPressed(INPUT.CANCEL)){
			audio_play_sound(snd_menu_switch,0,false);
			Battle_SetMenu(BATTLE_MENU.BUTTON);
		}
		//确定
		if(Input_IsPressed(INPUT.CONFIRM)){
			audio_play_sound(snd_menu_confirm,0,false);
			Battle_SetMenu(BATTLE_MENU.CHECK_DESCRIPTION);
		}
	}else
	
	//行动目标
	if(_menu==BATTLE_MENU.CHECK_DESCRIPTION){
		//上/下
		if(Input_IsPressed(INPUT.UP)){
			var action=_menu_choice_check_description[Flag_Get(FLAG_TYPE.TEMP,FLAG_TEMP.MEMBER_ACTIVE,0)]-1;
			if(action>=0){
				audio_play_sound(snd_menu_switch,0,false);
				Battle_SetMenuChoiceCheckDesc(action);
				Battle_SetMenu(BATTLE_MENU.CHECK_DESCRIPTION);
			}
		}else if(Input_IsPressed(INPUT.DOWN)){
			var action=_menu_choice_check_description[Flag_Get(FLAG_TYPE.TEMP,FLAG_TEMP.MEMBER_ACTIVE,0)]+1;
			if(action<=2){
				audio_play_sound(snd_menu_switch,0,false);
				Battle_SetMenuChoiceCheckDesc(action);
				Battle_SetMenu(BATTLE_MENU.CHECK_DESCRIPTION);
			}
		}
		//返回
		if(Input_IsPressed(INPUT.CANCEL)){
			audio_play_sound(snd_menu_switch,0,false);
			Battle_SetMenu(BATTLE_MENU.CHECK_TARGET);
		}
	}else
	
	//物品
	if(_menu==BATTLE_MENU.BAG){
		//上/下
		if(Input_IsPressed(INPUT.UP)){
			var slot=Battle_GetMenuChoiceItem()-1;
			if(slot>=0){
				audio_play_sound(snd_menu_switch,0,false);
				Battle_SetMenuChoiceItem(slot);
			}
		}else if(Input_IsPressed(INPUT.DOWN)){
			var slot=Battle_GetMenuChoiceItem()+1;
			if(slot<Item_GetNumber()){
				audio_play_sound(snd_menu_switch,0,false);
				Battle_SetMenuChoiceItem(slot);
			}
		}else if(Input_IsPressed(INPUT.CANCEL)){
			audio_play_sound(snd_menu_switch,0,false);
			Battle_SetMenu(BATTLE_MENU.BUTTON);
		}else if(Input_IsPressed(INPUT.CONFIRM)){
			audio_play_sound(snd_menu_confirm,0,false);
			battle_ui.hint_active=false;
			Battle_SetHintDialog("",true);
			turn_event[Flag_Get(FLAG_TYPE.TEMP,FLAG_TEMP.MEMBER_ACTIVE,0)]=BATTLE_MENU.BAG_EVENT;
			battle_ui.party_type[Flag_Get(FLAG_TYPE.TEMP,FLAG_TEMP.MEMBER_ACTIVE,0)]=3;
			Battle_NextMember();
		}
		
		battle_soul.x=55;
		battle_soul.y=354+36+32*(Battle_GetMenuChoiceItem()-_menu_choice_item_first[Flag_Get(FLAG_TYPE.TEMP,FLAG_TEMP.MEMBER_ACTIVE,0)]);
	}
}

//对话
if(_state==BATTLE_STATE.DIALOG){
	if(!instance_exists(_dialog[0])){
		if(!Dialog_IsEmpty()){
			Battle_SetDialog(Dialog_Get()+"{pause}{end}");
		}else{
			if(Battle_IsDialogAutoEnd()){
				Battle_EndDialog();
			}
		}
	}
}

//回合准备
if(_state==BATTLE_STATE.ATTACK_PREPARATION){
	if(Battle_IsTurnPreparationAutoEnd()){
		if(!instance_exists(text_typer)){
			Battle_EndTurnPreparation();
		}
	}
}

//回合内
if(_state==BATTLE_STATE.ATTACK_PHASE){
	if(!instance_exists(text_typer)){
		if(turn_progress>=array_length(battle_turn_order)){
			Battle_SetNextState(BATTLE_STATE.AILMENT_EFFECTS);
		}else{
			Battle_GotoNextState()
		}
	}
}
//回合内
if(_state==BATTLE_STATE.SECOND_ATTACK_PHASE){
	if(!instance_exists(text_typer)){
		if(instance_exists(battle_enemy_autoriel)){
			if(battle.turn_progress<array_length(battle.battle_turn_order)){
				if(battle.battle_turn_order[battle.turn_progress]==3||Battle_GetState()==BATTLE_STATE.SECOND_ATTACK_PHASE){
					Battle_GotoNextState()
				}else{
					if(turn_progress>=array_length(battle_turn_order)){
						Battle_SetState(BATTLE_STATE.AILMENT_EFFECTS);
					}else{
						Battle_GotoNextState()
					}
				}
			}else{
				if(turn_progress>=array_length(battle_turn_order)){
					Battle_SetState(BATTLE_STATE.AILMENT_EFFECTS);
				}else{
					Battle_GotoNextState()
				}
			}
		}else{
			if(turn_progress>=array_length(battle_turn_order)){
				Battle_SetState(BATTLE_STATE.AILMENT_EFFECTS);
			}else{
				Battle_GotoNextState()
			}
		}
	}
}
//面板重置
if(_menu==BATTLE_MENU.SKILL_EVENT||_menu==BATTLE_MENU.BAG_EVENT){
	
}

if(_menu==BATTLE_MENU.SKILL_EVENT_END){
	if(instance_exists(battle_skill_bomb)&&!instance_exists(text_typer)){
		Battle_EndMenu();
	}
}

if(_state==BATTLE_STATE.AILMENT_EFFECTS){
	if(!instance_exists(text_typer)){
		Battle_GotoNextState()
	}
}

if(_state==BATTLE_STATE.AILMENT_EFFECTS_AFTER){
	if(!instance_exists(text_typer)){
		Battle_EndTurn()
	}
}

if(_state==BATTLE_STATE.RESULT){
	if(!instance_exists(_dialog[0])){
		Battle_End();
	}
}

if(_menu==BATTLE_MENU.DEFEND){

}

//检查战斗结束
if(_state!=BATTLE_STATE.RESULT && Battle_GetEnemyNumber()==0){
	Battle_SetState(BATTLE_STATE.RESULT);
	Battle_SetNextState(BATTLE_STATE.RESULT);
	BGM_Stop(5);
	var text="{define `EXP` "+string(Battle_GetRewardExp())+"}{define `GOLD` "+string(Battle_GetRewardGold())+"}";
	text+=Lang_GetString("battle.result.won");
	Player_SetExp(Player_GetExp()+Battle_GetRewardExp());
	Player_SetGold(Player_GetGold()+Battle_GetRewardGold());
	if(Player_UpdateLv()){
		text+="&"+Lang_GetString("battle.result.lv_up");
		audio_play_sound(snd_level_up,0,false);
	}
	text+="{pause}{end}";
	Battle_SetDialog(text);
}
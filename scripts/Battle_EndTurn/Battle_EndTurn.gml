function Battle_EndTurn() {
	Battle_SetTurnNumber(Battle_GetTurnNumber()+1);
	/*var LAST=Battle_ConvertMenuChoiceEnemyToEnemySlot(Battle_GetMenuChoiceEnemy());
	var proc=0;
	repeat(3){
		if(proc!=LAST){
			Battle_CallEnemyEvent(BATTLE_ENEMY_EVENT.TURN_END,proc);
		}
		proc+=1;
	}*/
	Battle_CallEnemyEvent(BATTLE_ENEMY_EVENT.TURN_END);
	
	if(instance_exists(battle_attack)){
		with(battle_attack){
			event_user(BATTLE_TURN_EVENT.TURN_END);
		}
	}
	if(instance_exists(battle_menu_skill)){
		with(battle_menu_skill){
			instance_destroy();
		}
	}
	if(instance_exists(item)){
		with(item){
			instance_destroy();
		}
	}
	battle.turn_progress=0;
	battle._ailment_check=0;
	battle._ailment_target=0;
	Flag_Set(FLAG_TYPE.TEMP,FLAG_TEMP.GOSPEL_PASSIVE_BOOST,0)
	Flag_Set(FLAG_TYPE.TEMP,FLAG_TEMP.WHIMSIE_BOMB_FUSE,1)
	Flag_Set(FLAG_TYPE.TEMP,FLAG_TEMP.WHIMSIE_BOMB_FUSE+1,1)
	if(Flag_Get(FLAG_TYPE.STATIC,FLAG_STATIC.PARTY_PASSIVE,0)==0){
		Flag_Set(FLAG_TYPE.TEMP,FLAG_TEMP.WHIMSIE_PASSIVE_ACTIVE,2)
	}else{
		Flag_Set(FLAG_TYPE.TEMP,FLAG_TEMP.WHIMSIE_PASSIVE_ACTIVE,0)
	}
	var proc=0;
	repeat(battle_ui.party_size){
		var proc2=0;
		var has_ailment=0;
		repeat(ds_list_size(Flag_Get(FLAG_TYPE.STATIC,FLAG_STATIC.PARTY_AILMENTS+battle_ui.party_member[proc],0))){
			if(ds_list_find_value(Flag_Get(FLAG_TYPE.STATIC,FLAG_STATIC.PARTY_AILMENTS+battle_ui.party_member[proc],0),proc2)>=1){
				has_ailment=ds_list_find_value(Flag_Get(FLAG_TYPE.STATIC,FLAG_STATIC.PARTY_AILMENTS+battle_ui.party_member[proc],0),proc2)
				ds_list_set(Flag_Get(FLAG_TYPE.STATIC,FLAG_STATIC.PARTY_AILMENTS_NUMBERS+battle_ui.party_member[proc],0),proc2,ds_list_find_value(Flag_Get(FLAG_TYPE.STATIC,FLAG_STATIC.PARTY_AILMENTS_NUMBERS+battle_ui.party_member[proc],0),proc2)-1)
				if(ds_list_find_value(Flag_Get(FLAG_TYPE.STATIC,FLAG_STATIC.PARTY_AILMENTS_NUMBERS+battle_ui.party_member[proc],0),proc2)<=0){
					has_ailment=-ds_list_find_value(Flag_Get(FLAG_TYPE.STATIC,FLAG_STATIC.PARTY_AILMENTS+battle_ui.party_member[proc],0),proc2)
					ds_list_set(Flag_Get(FLAG_TYPE.STATIC,FLAG_STATIC.PARTY_AILMENTS+battle_ui.party_member[proc],0),proc2,-1)
					ds_list_set(Flag_Get(FLAG_TYPE.STATIC,FLAG_STATIC.PARTY_AILMENTS_NUMBERS+battle_ui.party_member[proc],0),proc2,-1)
				}
			}
			proc2+=1
		}
		if(has_ailment!=14||has_ailment=-14){
			Battle_SetPartyBlock(0,battle_ui.party_member[proc])	
		}
		proc+=1
	}
	if(Player_GetPartyHp(battle_ui.party_member[0])>0){
		var dashes=" ---------------------"
		if(Battle_GetTurnNumber()>=10){
			dashes=" --------------------"
		}
		if(Battle_GetTurnNumber()>=100){
			dashes=" -------------------"
		}
		Battlelog_Add("\nTURN "+string(Battle_GetTurnNumber()+1)+dashes+"\n* Gospel prepares to strike!\n\n");
		Battlelog_Add("Whimsie's HP: "+string(Player_GetPartyHp(battle_ui.party_member[0])+Battle_GetPartyBlock(battle_ui.party_member[0]))+"/15\n")
		Battlelog_Add("Gospel's HP: "+string(battle_enemy_gospel._hp)+"/20\n")
		Battlelog_Add("Whimsie's AP: "+string(Battle_GetAp())+"/10\n")
		Battlelog_Add("Gospel's AP: "+string(Flag_Get(FLAG_TYPE.TEMP,FLAG_TEMP.ENEMY_AP,0))+"/10\n")
		Battlelog_Add("Whimsie's SP: "+string(round(Battle_GetSp()*2)/2)+"/12\n")
		Battlelog_Add("Gospel's SP: "+string(round(Flag_Get(FLAG_TYPE.TEMP,FLAG_TEMP.ENEMY_SP,0)*2)/2)+"/12\n")
		Battlelog_Add("Whimsie's Status: ")
		var proc=0;
		var proc2=0;
		repeat(ds_list_size(Flag_Get(FLAG_TYPE.STATIC,FLAG_STATIC.PARTY_AILMENTS+battle_ui.party_member[0],0))){
			if(ds_list_find_value(Flag_Get(FLAG_TYPE.STATIC,FLAG_STATIC.PARTY_AILMENTS+battle_ui.party_member[0],0),proc)>=1){
				var name = battle._ailment_names[ds_list_find_value(Flag_Get(FLAG_TYPE.STATIC,FLAG_STATIC.PARTY_AILMENTS+battle_ui.party_member[0],0),proc)]
				var number = string(ds_list_find_value(Flag_Get(FLAG_TYPE.STATIC,FLAG_STATIC.PARTY_AILMENTS_NUMBERS+battle_ui.party_member[0],0),proc))
				Battlelog_Add(name+" ("+number+")")
				if(proc2<ds_list_size(Flag_Get(FLAG_TYPE.STATIC,FLAG_STATIC.PARTY_AILMENTS+battle_ui.party_member[0],0))){
					Battlelog_Add(", ")
				}
				proc2+=1
			}
			proc+=1
		}
		if(proc2==0){
			Battlelog_Add("None")
		}
		Battlelog_Add("\nGospel's Status: ")
		var proc=0;
		var proc2=0;
		repeat(array_length(battle_enemy_gospel.enemy_ailments)){
			if(battle_enemy_gospel.enemy_ailments[proc]>=1){
				var name = battle._ailment_names[battle_enemy_gospel.enemy_ailments[proc]]
				var number = string(battle_enemy_gospel.enemy_ailment_numbers[proc])
				Battlelog_Add(name+" ("+number+")")
				if(proc2<array_length(battle_enemy_gospel.enemy_ailments)){
					Battlelog_Add(", ")
				}
				proc2+=1
			}
			proc+=1
		}
		if(proc2==0){
			Battlelog_Add("None")
		}
		Battlelog_Add("\n\n")
	}
	Battle_GotoNextState();
	return true;
}

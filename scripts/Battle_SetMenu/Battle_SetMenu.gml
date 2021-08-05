///@arg menu
///@arg call_event*
function Battle_SetMenu() {
	var MENU=argument[0];
	var CALL=true;
	if(argument_count>=2){
		CALL=argument[1];
	}

	battle._menu=MENU;
	Battle_SetDialog("",false,false);
	Battle_SetDialog("",false,true);
	
	////////////////////////////////////////
	//按钮
	if(MENU==BATTLE_MENU.BUTTON){
		if(Flag_Get(FLAG_TYPE.TEMP,FLAG_TEMP.MEMBER_ACTIVE,0)){
			with(battle_ui)
			{
				if(menu_open==0)
				{
					menu_close=0;
					menu_closed=false;
				}else{
					menu_close=-1;
					menu_closed=false;	
				}
				if(menu_open==0||menu_open==-1)
				{
					menu_open=1;
					menu_opened=false;
				}
			}
		}else{
			with(battle_ui)
			{
				if(menu_open==1)
				{
					menu_close=1;
					menu_closed=false;
				}else{
					menu_close=-1;
					menu_closed=false;	
				}
				if(menu_open==1||menu_open==-1)
				{
					menu_open=0;
					menu_opened=false;
				}
			}
		}
		battle_ui.hint_active=false;
		battle_ui.use_ap=0;
		Battle_SetHintDialog("",true);
		Battle_SetDialog(Battle_GetMenuDialog());
	}
	
	////////////////////////////////////////
	//战斗/行动目标
	if(MENU==BATTLE_MENU.SKILL_TARGET || MENU==BATTLE_MENU.CHECK_TARGET){
		//越界归零
		if(Battle_GetMenuChoiceEnemy()>=Battle_GetEnemyNumber()){
			Battle_SetMenuChoiceEnemy(0,false);
		}
		
		var text="";
		var proc=0;
		//创建敌人列表文字
		if(Battle_GetSkillTarget(ds_list_find_value(Flag_Get(FLAG_TYPE.STATIC,FLAG_STATIC.PARTY_MOVESETS+battle_ui.party_member[Flag_Get(FLAG_TYPE.TEMP,FLAG_TEMP.MEMBER_ACTIVE,0)]),Battle_GetMenuChoiceAction()))=="ENEMY"){
			repeat(3){
				var inst=Battle_GetEnemy(proc);
				if(instance_exists(inst)){
					if(Battle_IsEnemySpareable(proc)){
						text+="{color `yellow`}"
					}
					text+=Battle_GetEnemyName(proc)+"{color `white`}&";
				}
				proc+=1;
			}
		}else{
			if(Battle_GetMenuChoiceEnemy()>=2){
				Battle_SetMenuChoiceEnemy(0,false);
			}
			repeat(battle_ui.party_size){
				//Create enemy's hp bar
				if(MENU==BATTLE_MENU.SKILL_TARGET){
					var inst=instance_create_depth(0,0,0,battle_menu_fight_hp_bar);
					inst.player_mode=1;
					inst.enemy_slot=proc;
					inst.hp_max=Player_GetPartyHpMax(proc);
					inst.hp=Player_GetPartyHp(proc);
					inst.width=76;
					inst.color=battle_ui.default_party_color[proc];
				}
				if(!ds_list_empty(Flag_Get(FLAG_TYPE.STATIC,FLAG_STATIC.PARTY_AILMENTS,0))){
					var inst=instance_create_depth(0,0,0,battle_menu_fight_ailments);
					inst.player_mode=1;
					inst.enemy_slot=_enemy_slot;
					inst.ailment_list=Flag_Get(FLAG_TYPE.STATIC,FLAG_STATIC.PARTY_AILMENTS,0)
					inst.ailment_numbers=Flag_Get(FLAG_TYPE.STATIC,FLAG_STATIC.PARTY_AILMENTS_NUMBERS,0)
					inst.ailment_max=ds_list_size(Flag_Get(FLAG_TYPE.STATIC,FLAG_STATIC.PARTY_AILMENTS,0))
				}
				text+=Player_GetPartyName(proc)+"&";
				proc+=1;
			}
		}
		Battle_SetDialog(text,true);
		battle_ui.hint_active=false;
		battle_ui.use_ap=0;
		Battle_SetHintDialog("",true);
	}
	
	if(MENU==BATTLE_MENU.SKILL_EVENT||MENU==BATTLE_MENU.BAG_EVENT){
		with(battle_ui)
		{
			menu_close=menu_open;
			menu_open=-1;
			menu_opened=false;
			menu_closed=false;
		}
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
		Anim_Destroy(battle_ui,"incoming_y")
		Anim_Destroy(battle_ui,"incoming_y2")
		Battle_SetMenuFightAnimTime(0);
		Battle_SetMenuFightDamageTime(0);
		if(MENU==BATTLE_MENU.SKILL_EVENT){
			var OBJ=ds_list_find_value(Flag_Get(FLAG_TYPE.STATIC,FLAG_STATIC.PARTY_MOVESETS+battle_ui.party_member[battle.battle_turn_order[battle.turn_progress]]),Battle_GetMenuChoiceAction());
			if(object_exists(OBJ)){
				if(OBJ==battle_menu_skill||Object_GetBaseParent(OBJ)==battle_menu_skill){
					var inst=instance_create_depth(0,0,0,OBJ);
					if(battle_ui.party_type[battle.battle_turn_order[battle.turn_progress]]==3){
						inst.target=battle.battle_turn_order[battle.turn_progress]
					}
				}
			}
		}else if(MENU==BATTLE_MENU.BAG_EVENT){
			battle._menu_item_used_last[battle.battle_turn_order[battle.turn_progress]]=Item_Get(Battle_GetMenuChoiceItem());
			var OBJ=Item_Get(Battle_GetMenuChoiceItem())
			if(object_exists(OBJ)){
				if(OBJ==item||Object_GetBaseParent(OBJ)==item){
					var inst=instance_create_depth(0,0,0,OBJ);
				}
			}	
		}
	}
	////////////////////////////////////////
	//行动内容
	if(MENU==BATTLE_MENU.SKILL_SELECT){
		var num=ds_list_size(Flag_Get(FLAG_TYPE.STATIC,FLAG_STATIC.PARTY_MOVESETS+battle_ui.party_member[Flag_Get(FLAG_TYPE.TEMP,FLAG_TEMP.MEMBER_ACTIVE,0)],0))
	
		//越界归零
		if(Battle_GetMenuChoiceAction()>=num){
			Battle_SetMenuChoiceAction(0,false);
		}
	
		var proc=0;
		var text="";
		var text2="";
		var target=0;
		//创建行动列表文字
		repeat(ds_list_size(Flag_Get(FLAG_TYPE.STATIC,FLAG_STATIC.PARTY_MOVESETS+battle_ui.party_member[Flag_Get(FLAG_TYPE.TEMP,FLAG_TEMP.MEMBER_ACTIVE,0)],0))){
			if(!target){
				text+=Battle_GetSkillName(ds_list_find_value(Flag_Get(FLAG_TYPE.STATIC,FLAG_STATIC.PARTY_MOVESETS+battle_ui.party_member[Flag_Get(FLAG_TYPE.TEMP,FLAG_TEMP.MEMBER_ACTIVE,0)],noone),proc))+"&";
				target=!target;
			}else{
				text2+=Battle_GetSkillName(ds_list_find_value(Flag_Get(FLAG_TYPE.STATIC,FLAG_STATIC.PARTY_MOVESETS+battle_ui.party_member[Flag_Get(FLAG_TYPE.TEMP,FLAG_TEMP.MEMBER_ACTIVE,0)],noone),proc))+"&";
				target=!target;
			}
			proc+=1;
		}
		battle_ui.use_ap=Battle_GetSkillApCost(ds_list_find_value(Flag_Get(FLAG_TYPE.STATIC,FLAG_STATIC.PARTY_MOVESETS+battle_ui.party_member[Flag_Get(FLAG_TYPE.TEMP,FLAG_TEMP.MEMBER_ACTIVE,0)]),Battle_GetMenuChoiceAction()))
		Battle_SetDialog(text,true);
		Battle_SetDialog(text2,true,true);
		var text3=Battle_GetSkillInfo(ds_list_find_value(Flag_Get(FLAG_TYPE.STATIC,FLAG_STATIC.PARTY_MOVESETS+battle_ui.party_member[Flag_Get(FLAG_TYPE.TEMP,FLAG_TEMP.MEMBER_ACTIVE,0)],0),Battle_GetMenuChoiceAction()))+"&";
		battle_ui.hint_active=true;
		Battle_SetHintDialog(text3,true);
	}
	
	if(MENU==BATTLE_MENU.SKILL_POWER){
		var num=ds_list_size(Flag_Get(FLAG_TYPE.STATIC,FLAG_STATIC.PARTY_MOVESETS+battle_ui.party_member[Flag_Get(FLAG_TYPE.TEMP,FLAG_TEMP.MEMBER_ACTIVE,0)],0))
	
		var proc=0;
		var text="";
		var text2="";
		var target=0;
		//创建行动列表文字
		repeat(ds_list_size(Flag_Get(FLAG_TYPE.STATIC,FLAG_STATIC.PARTY_MOVESETS+battle_ui.party_member[Flag_Get(FLAG_TYPE.TEMP,FLAG_TEMP.MEMBER_ACTIVE,0)],0))){
			if(!target){
				text+=Battle_GetSkillName(ds_list_find_value(Flag_Get(FLAG_TYPE.STATIC,FLAG_STATIC.PARTY_MOVESETS+battle_ui.party_member[Flag_Get(FLAG_TYPE.TEMP,FLAG_TEMP.MEMBER_ACTIVE,0)],noone),proc))+"&";
				target=!target;
			}else{
				text2+=Battle_GetSkillName(ds_list_find_value(Flag_Get(FLAG_TYPE.STATIC,FLAG_STATIC.PARTY_MOVESETS+battle_ui.party_member[Flag_Get(FLAG_TYPE.TEMP,FLAG_TEMP.MEMBER_ACTIVE,0)],noone),proc))+"&";
				target=!target;
			}
			proc+=1;
		}
		battle_ui.use_ap=Battle_GetSkillApCost(ds_list_find_value(Flag_Get(FLAG_TYPE.STATIC,FLAG_STATIC.PARTY_MOVESETS+battle_ui.party_member[Flag_Get(FLAG_TYPE.TEMP,FLAG_TEMP.MEMBER_ACTIVE,0)]),Battle_GetMenuChoiceAction()))
		Battle_SetDialog(text,true);
		Battle_SetDialog(text2,true,true);
		var text3=Battle_GetSkillPowerInfo(ds_list_find_value(Flag_Get(FLAG_TYPE.STATIC,FLAG_STATIC.PARTY_MOVESETS+battle_ui.party_member[Flag_Get(FLAG_TYPE.TEMP,FLAG_TEMP.MEMBER_ACTIVE,0)],0),Battle_GetMenuChoiceAction()))+"&";
		battle_ui.hint_active=true;
		Battle_SetHintDialog(text3,true);
	}

	//物品
	if(MENU==BATTLE_MENU.BAG){
		Battle_SetMenuChoiceItem(0,false);
	}

	//仁慈
	if(MENU==BATTLE_MENU.DEFEND){
		with(battle_ui)
		{
			menu_close=menu_open;
			menu_open=-1;
			menu_opened=false;
			menu_closed=false;
		}
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
		Anim_Destroy(battle_ui,"incoming_y")
		Anim_Destroy(battle_ui,"incoming_y2")
		Battle_SetMenuFightAnimTime(0);
		Battle_SetMenuFightDamageTime(0);
	
		var inst=instance_create_depth(0,0,0,battle_menu_skill_defend);
		inst.target=battle.battle_turn_order[battle.turn_progress]
		with(inst){
			event_user(BATTLE_MENU_FIGHT_EVENT.ANIM);
		}
	}
	////////////////////////////////////////
	if(CALL){
		Battle_CallEnemyEvent(BATTLE_ENEMY_EVENT.MENU_SWITCH);
	}

	if(MENU==BATTLE_MENU.BAG_EVENT){
		if(instance_exists(item)){
			with(item){
				_item_slot=Battle_GetMenuChoiceItem();
				user=battle.battle_turn_order[battle.turn_progress];
				event_user(ITEM_EVENT.USE);
			}
		}
	}

	if(MENU==BATTLE_MENU.SKILL_EVENT){
		if(instance_exists(battle_menu_skill)){
			with(battle_menu_skill){
				event_user(BATTLE_MENU_FIGHT_EVENT.ANIM);
			}
		}
	}

	if(MENU==BATTLE_MENU.SKILL_DAMAGE){
		if(instance_exists(battle_menu_skill)){
			with(battle_menu_skill){
				event_user(BATTLE_MENU_FIGHT_EVENT.DAMAGE);
			}
		}
	}

	if(MENU==BATTLE_MENU.CHECK_DESCRIPTION){
		if(!instance_exists(battle_menu_enemy_statscrollbar)){
			instance_create_depth(0,0,0,battle_menu_enemy_statscrollbar)
		}
		var text=""
		with(Battle_GetEnemy(Battle_ConvertMenuChoiceEnemyToEnemySlot(Battle_GetMenuChoiceEnemy()))){
			text = check_desc[Battle_GetMenuChoiceCheckDesc()]
		}
		Battle_SetDialog("{instant true}"+text);
	}

	return true;


}

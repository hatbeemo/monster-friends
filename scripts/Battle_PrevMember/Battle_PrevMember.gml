function Battle_PrevMember() {
	if(Flag_Get(FLAG_TYPE.TEMP,FLAG_TEMP.MEMBER_ACTIVE,0)>=1&&Player_GetPartyHp(battle_ui.party_member[0])>0){
		audio_play_sound(snd_menu_switch,0,false);
		Flag_Set(FLAG_TYPE.TEMP,FLAG_TEMP.MEMBER_ACTIVE,0)
		Battle_SetMenu(BATTLE_MENU.BUTTON)
		battle_ui.party_type[0]=5+battle_ui.party_member[0];
		battle_ui.party_type[1]=5+battle_ui.party_member[1];
	}
}

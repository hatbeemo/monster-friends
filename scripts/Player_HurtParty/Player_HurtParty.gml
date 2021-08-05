///@arg damage
function Player_HurtParty() {
	var DAMAGE=argument[0];
	var MEMBER=argument[1];
	if(DAMAGE>=0){
		var HP=Flag_Get(FLAG_TYPE.STATIC,FLAG_STATIC.PARTY_HP+MEMBER);
		Flag_Set(FLAG_TYPE.STATIC,FLAG_STATIC.PARTY_HP+MEMBER,(HP-DAMAGE>=0 ? HP-DAMAGE : 0));
		battle_ui.new_bar_color=RED_COLOR;
		battle_ui.bar_color_timer=2;
		battle_ui.new_hp_color[MEMBER]=RED_COLOR;
		battle_ui.hp_color_timer[MEMBER]=2;
		if(Player_GetPartyHp(MEMBER)<=0){
			battle_ui.new_name_color[MEMBER]=RED_COLOR;
			battle_ui.name_color_timer[MEMBER]=2;
			battle_ui.new_party_color[MEMBER]=RED_COLOR;
			battle_ui.party_color_timer[MEMBER]=2;
		}
		return true;
	}else{
		return Player_HealParty(-DAMAGE,MEMBER);
	}


}

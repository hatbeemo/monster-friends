function Player_GetPartyHp() {
	var MEMBER=argument[0];
	
	return Flag_Get(FLAG_TYPE.STATIC,FLAG_STATIC.PARTY_HP+MEMBER);
		
}

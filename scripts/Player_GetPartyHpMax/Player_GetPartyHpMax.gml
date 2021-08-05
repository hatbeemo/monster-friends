function Player_GetPartyHpMax() {
	var MEMBER=argument[0];
	
	return Flag_Get(FLAG_TYPE.STATIC,FLAG_STATIC.PARTY_HP_MAX+MEMBER);

}

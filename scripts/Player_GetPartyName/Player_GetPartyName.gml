function Player_GetPartyName() {
	var MEMBER=argument[0];
	
	return Flag_Get(FLAG_TYPE.STATIC,FLAG_STATIC.PARTY_NAME+MEMBER);

}

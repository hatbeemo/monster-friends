///@arg member
function Battle_GetPartyBlock() {
	var MEMBER=argument[0];
	return Flag_Get(FLAG_TYPE.TEMP,FLAG_TEMP.PARTY_BLOCK+MEMBER);
}

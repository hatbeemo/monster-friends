///@arg block
///@arg member
function Battle_SetPartyBlock() {
	var BLOCK=argument[0];
	var MEMBER=argument[1];
	if(BLOCK>=0){
		Flag_Set(FLAG_TYPE.TEMP,FLAG_TEMP.PARTY_BLOCK+MEMBER,BLOCK);
	}else{
		Flag_Set(FLAG_TYPE.TEMP,FLAG_TEMP.PARTY_BLOCK+MEMBER,0);
	}
}

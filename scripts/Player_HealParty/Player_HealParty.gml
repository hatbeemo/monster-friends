///@arg heal
function Player_HealParty() {
	var HEAL=argument[0];
	var MEMBER=argument[1];
	if(HEAL>=0){
		var HP=Flag_Get(FLAG_TYPE.STATIC,FLAG_STATIC.PARTY_HP+MEMBER);
		var HP_MAX=Flag_Get(FLAG_TYPE.STATIC,FLAG_STATIC.PARTY_HP_MAX+MEMBER);
		Flag_Set(FLAG_TYPE.STATIC,FLAG_STATIC.PARTY_HP+MEMBER,(HP+HEAL<=HP_MAX ? HP+HEAL : HP_MAX));
		return true;
	}else{
		return Player_HurtParty(-HEAL,MEMBER);
	}


}

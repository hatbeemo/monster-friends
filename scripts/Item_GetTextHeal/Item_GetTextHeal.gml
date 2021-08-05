///@arg heal_hp
///@arg member
///@arg new_line*
function Item_GetTextHeal() {
	var HEAL=argument[0];
	var MEMBER=argument[1];
	var LINE=true;
	if(argument_count>=3){
		LINE=argument[2];
	}
	var result="";
	result+=(LINE ? "&" : "");

	if(Flag_Get(FLAG_TYPE.STATIC,FLAG_STATIC.PARTY_HP+MEMBER)>=Flag_Get(FLAG_TYPE.STATIC,FLAG_STATIC.PARTY_HP_MAX+MEMBER)){
		result+="'s HP was maxed out!";
	}else{
		result+=" recovered "+string(HEAL)+" HP!";
	}

	return result;


}

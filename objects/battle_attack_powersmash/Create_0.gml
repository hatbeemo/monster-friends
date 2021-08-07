event_inherited()
name="POWER SMASH";
powerboost=0;
color=RED_COLOR;
if(battle_ui.party_size==1||Player_GetPartyHp(battle_ui.party_member[1])<=0){
	target=battle_ui.party_member[0]
}else if(Player_GetPartyHp(battle_ui.party_member[0])<=0){
	target=battle_ui.party_member[1]
}else{
	target=battle_ui.party_member[irandom(1)]
}
damage=2;
attack_priority=0;
remove_bomb=false;
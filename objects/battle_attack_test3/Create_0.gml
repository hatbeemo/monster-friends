event_inherited()
name="KARATE CHOP"
color=RED_COLOR
if(battle_ui.party_size==1||Player_GetPartyHp(battle_ui.party_member[1])<=0){
	target=battle_ui.party_member[0]
}else if(Player_GetPartyHp(battle_ui.party_member[0])<=0){
	target=battle_ui.party_member[1]
}else{
	target=battle_ui.party_member[irandom(1)]
}
damage=1;
attack_priority=0;
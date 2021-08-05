event_inherited()
name="OVERCLOCK"
if(battle_ui.party_size==1||Player_GetPartyHp(battle_ui.party_member[1])<=0){
	target=battle_ui.party_member[0]
}else if(Player_GetPartyHp(battle_ui.party_member[0])<=0){
	target=battle_ui.party_member[1]
}else{
	target=battle_ui.party_member[irandom(1)]
}
damage=1;
attack_priority=0;
_special_fx=0;
_fx_timer=0;
special_y=-120;
_done=0;
depth=DEPTH_BATTLE.UI_HIGH
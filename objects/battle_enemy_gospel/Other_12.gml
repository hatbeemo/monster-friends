///@desc Menu Start
if(_did_special>0){
	_did_special-=1;
}
//Player_HurtParty(20,battle_ui.party_member[0])
if(Player_GetPartyHp(battle_ui.party_member[0])<=0){
	global.gospel_hp=_hp;
	global.turns_lasted=Battle_GetTurnNumber();
	room_goto(room_endscreen_lose)
}
enemy_damage_deal=0;
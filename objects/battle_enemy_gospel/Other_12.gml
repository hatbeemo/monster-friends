///@desc Menu Start
if(_did_special>0){
	_did_special-=1;
}
if(Player_GetPartyHp(battle_ui.party_member[0])<=0){
	room_goto(room_endscreen_lose)
}
enemy_damage_deal=0;
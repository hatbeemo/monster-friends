///@desc Use
text="* "+Player_GetPartyName(battle_ui.party_member[user])+" drank the Chocolate&  Milk.{sleep 20}&* It was very delicious.{pause}"
Battlelog_Add(Player_GetPartyName(battle_ui.party_member[user])+" drank the Chocolate Milk. It was very delicious.\n")
if(Player_GetPartyHp(battle_ui.party_member[user])<=7){
	text+="{clear}* It helped to numb the pain&  a little bit.{pause}{end}"
	Battlelog_Add("It helped to numb the pain a little bit.\n")
}else{
	text+="{end}"
}
Battle_SetDialog(text);

Item_Remove(_item_slot);

audio_play_sound(snd_item_swallow,0,false);

event_inherited();
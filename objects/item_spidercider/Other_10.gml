///@desc Use
Player_HealParty(5,battle_ui.party_member[user])

text="* "+Player_GetPartyName(battle_ui.party_member[user])+" drank the Spider Cider.&* "+Player_GetPartyName(battle_ui.party_member[user])+Item_GetTextHeal(5,battle_ui.party_member[user],false)+"{pause}{end}"
Battlelog_Add(Player_GetPartyName(battle_ui.party_member[user])+" drank the Spider Cider.\n"+Player_GetPartyName(battle_ui.party_member[user])+Item_GetTextHeal(5,battle_ui.party_member[user],false)+"\n")
Battle_SetDialog(text);

Item_Remove(_item_slot);

audio_play_sound(snd_item_swallow,0,false);
alarm[0]=20;

event_inherited();
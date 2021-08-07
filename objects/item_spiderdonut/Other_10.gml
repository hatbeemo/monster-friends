///@desc Use
Player_HealParty(4,battle_ui.party_member[user])

text="* "+Player_GetPartyName(battle_ui.party_member[user])+" ate the Spider Donut.&* "+Player_GetPartyName(battle_ui.party_member[user])+Item_GetTextHeal(4,battle_ui.party_member[user],false)+"{pause}{end}"
Battlelog_Add(Player_GetPartyName(battle_ui.party_member[user])+" ate the Spider Donut.\n"+Player_GetPartyName(battle_ui.party_member[user])+Item_GetTextHeal(4,battle_ui.party_member[user],false)+"\n")
Battle_SetDialog(text);

Item_Remove(_item_slot);

audio_play_sound(snd_item_swallow,0,false);
alarm[0]=20;

event_inherited();
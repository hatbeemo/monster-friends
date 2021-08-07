///@desc Anim
event_inherited();
Flag_Set(FLAG_TYPE.TEMP,FLAG_TEMP.WHIMSIE_PASSIVE_ACTIVE,2);
audio_play_sound(snd_player_atk,0,false)
battle_ui.new_bar_color=AQUA_COLOR;
battle_ui.bar_color_timer=2;
battle_ui.new_hp_color[target]=AQUA_COLOR;
battle_ui.hp_color_timer[target]=2;
Flag_Set(FLAG_TYPE.STATIC,FLAG_STATIC.AP,Flag_Get(FLAG_TYPE.STATIC,FLAG_STATIC.AP,0)+1)
Battle_SetPartyBlock(Battle_GetPartyBlock(battle_ui.party_member[target])+1,battle_ui.party_member[target])
text="* "+Player_GetPartyName(battle_ui.party_member[target])+" braced themselves!&* "+Player_GetPartyName(battle_ui.party_member[target])+" gained {color_text `specaqua2`}1 BLOCK{color_text `white`}!&* "+Player_GetPartyName(battle_ui.party_member[target])+" gained {color_text `specaqua`}1 AP{color_text `white`}!{pause}{end}"
Battlelog_Add(Player_GetPartyName(battle_ui.party_member[target])+" braced themselves!\n"+Player_GetPartyName(battle_ui.party_member[target])+" gained 1 BLOCK!\n"+Player_GetPartyName(battle_ui.party_member[target])+" gained 1 AP!\n")
Battle_SetDialog(text)

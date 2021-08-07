///@desc Damage
event_inherited();
Player_EarnDamageSp(Battle_GetMenuFightDamage());
Battlelog_Add("Gospel takes "+string(Battle_GetMenuFightDamage())+" damage!\n")
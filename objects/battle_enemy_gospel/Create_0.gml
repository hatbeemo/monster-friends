depth=DEPTH_BATTLE.ENEMY;
_enemy_slot=-1;
image_speed=0;
image_index=0;
_damage_timer=-1;
enemy_ailments=-1;
enemy_ailment_numbers=-1;
powersmash_uses=0;
enemy_damage_deal=0;
//check_move[0]="???? ????  "
//check_move[1]="????? ?????"
//check_move[2]="????????   "
check_move[0]="Iron Whip  "
check_move[1]="Power Smash"
check_move[2]="Recharge   "
check_desc[0]="* {color_text `gospel`}Gospel{color_text `white`} - Known SKILLs&* {scale_x 1.4}Iron Whip {color_text `specred`}(1DMG + 1VUL){color_text `white`} / Power Smash {color_text `specred`}(2DMG){color_text `white`}{scale_x 2}&* {scale_x 1.4}Recharge {color_text `specaqua`}(3AP + 1VUL){color_text `white`}"
check_desc[1]="* Gospel Passive - {color_text `gospel`}Power Boost{color_text `white`}&* Spend up to {color_text `specaqua`}3 extra AP{color_text `white`} to boost&  a SKILL's {color_text `specred`}DMG{color_text `white`} by {color_text `specred`}1{color_text `white`} per {color_text `specaqua`}AP{color_text `white`}!"
check_desc[2]="* Gospel SPECIAL - {color_text `specgold`}Power Surge{color_text `white`}&* Recover {color_text `specaqua`}ALL AP{color_text `white`}.&* Gain {color_text `specred`}1 Vulnerable{color_text `white`}."
player_check_desc[0]="* {color_text `whimsie`}Whimsie{color_text `white`} - Status Info&* {scale 1}{color_text `specred`}{sprite `spr_battle_menu_ailments_text` 0}{scale 2}{scale_x 1.4}VULNERABLE: Attacks deal x1.5 more damage!{color_text `white`}{scale_x 2}&* {scale 1}{color_text `specaqua2`}{sprite `spr_battle_menu_ailments_text` 13}{scale 2}{scale_x 1.4}BLUR: Gained BLOCK is kept between turns.{color_text `white`}"
if(Flag_Get(FLAG_TYPE.STATIC,FLAG_STATIC.PARTY_PASSIVE,0)==1){
	player_check_desc[1]="* Whimsie Passive - {color_text `whimsie`}Fast Arms{color_text `white`}&* After using a SKILL, throw an&  extra bomb before your turn!"
}else{
	player_check_desc[1]="* Whimsie Passive - {color_text `gray_dark`}???{color_text `white`}"
}
player_check_desc[2]="* {scale_x 1.6}Whimsie SPECIAL{scale_x 2} - {color_text `specgold`}Panic Button (6{sprite `spr_battle_menu_spicon`}){color_text `white`}&* Instantly detonate all active&  bombs. Kaboom!"
_did_special=false;
powersmash_turns=0;
new_color=c_white
color_timer=0;
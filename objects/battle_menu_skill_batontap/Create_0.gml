ap_cost=0;
use_name="{color_text `whimsie`}Baton Tap"
name="Baton Tap [{color_text `specaqua`}0{color_text `white`}]"
info="Whimsie deals {color_text `specred`}2{color_text `white`} damage&to one enemy."
text="* Whimsie used "+use_name+"{color_text `white`}!{pause}{end}"
power_info="Skip throwing an extra bomb&this turn."
damage=2;
deals_dmg=1;
target="ENEMY";
_done=false;
_no_ap=false;
is_bomb=false;
Battle_SetMenuFightAnimTime(30);
Battle_SetMenuFightDamageTime(45);
Battle_SetMenuFightDamage(damage);
ap_cost=2;
use_name="{color_text `mopsy`}Aura Discharge"
name="{scale_x 1.8}Aura Discharge[{color_text `specaqua`}2{color_text `white`}]{scale_x 2}"
info="Mopsy clears all {color_text `mopsy`}Auras{color_text `white`} and&activates their {color_text `specred`}DISPEL{color_text `white`} effects."
text="* Mopsy cast "+use_name+"{color_text `white`}!{pause}{end}"
text_echo="* Mopsy {color_text `mopsy`}echo-cast "+use_name+"{color_text `white`}!{pause}{end}"
damage=2;
deals_dmg=1;
target="ENEMY";
_done=false;
_no_ap=false;
Battle_SetMenuFightAnimTime(30);
Battle_SetMenuFightDamageTime(45);
Battle_SetMenuFightDamage(damage);
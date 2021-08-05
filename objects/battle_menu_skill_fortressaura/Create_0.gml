ap_cost=0;
use_name="{color_text `specaqua`}Fortress Aura"
name="{scale_x 1.6}Fortress Aura[{color_text `mopsy`}2{scale_x 2}{sprite `spr_battle_menu_mopsycosts` 3}{scale_x 1.6}{color_text `white`}]{scale_x 2}"
info="Mopsy channels {color_text `specaqua`}Fortress Aura{color_text `white`}.&The party will gain 2 BLOCK every&turn while active."
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
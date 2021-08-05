ap_cost=0;
use_name="{color_text `specgold`}Energy Aura"
name="{scale_x 1.8}Energy Aura[{color_text `mopsy`}2{sprite `spr_battle_menu_mopsycosts` 0}{color_text `white`}]{scale 2}"
info="Mopsy channels {color_text `specgold`}Energy Aura{color_text `white`}.&The party will gain 1 additional&AP starting every turn while active."
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
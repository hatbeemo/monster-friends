ap_cost=0;
use_name="{color_text `speclime`}Life Aura"
name="Life Aura[{color_text `mopsy`}3{sprite `spr_battle_menu_mopsycosts` 2}{color_text `white`}]"
info="Mopsy channels {color_text `speclime`}Life Aura{color_text `white`}.&The party will heal 1 HP starting&every turn while active."
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
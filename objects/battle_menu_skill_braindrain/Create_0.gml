ap_cost=0;
use_name="{color_text `mopsy`}Brain Drain"
name="Brain Drain[{color_text `specaqua`}0{color_text `white`}]"
info="Mopsy absorbs {color_text `specaqua`}1 AP{color_text `white`} from&one enemy."
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
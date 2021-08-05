damage=0
ap_cost=0
use_name="{color_text `specaqua`}Recharge"
name="Recharge"
name+=" {color_text `white`}[{color_text `specaqua`}"+string(ap_cost)+"{color_text `white`}]"
info="Party recovers {color_text `specaqua`}4 AP{color_text `white`}.&Gospel gains {color_text `specred`}1 Vulnerable{color_text `white`}."
power_info_zero=" "
power_info=" "
text="* Gospel used "+use_name+"{color_text `white`}!&* Party recovered {color_text `specaqua`}4 AP{color_text `white`}!&* Gospel gained {color_text `specred`}1 Vulnerable{color_text `white`}!{pause}{end}{pause}{end}"
target="ALL";
deals_dmg=0;
_done=false;
_no_ap=false;
Battle_SetMenuFightAnimTime(30);
Battle_SetMenuFightDamageTime(45);
Battle_SetMenuFightDamage(damage);
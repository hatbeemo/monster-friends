damage=2+Flag_Get(FLAG_TYPE.TEMP,FLAG_TEMP.GOSPEL_PASSIVE_BOOST,0);
ap_cost=2+Flag_Get(FLAG_TYPE.TEMP,FLAG_TEMP.GOSPEL_PASSIVE_BOOST,0);
use_name="{color_text `specred`}Iron Whip"
if(Flag_Get(FLAG_TYPE.TEMP,FLAG_TEMP.GOSPEL_PASSIVE_BOOST,0)>=1){
	use_name="{color_text `specred`}Iron Whip{color_text `gospel`}+"+string(Flag_Get(FLAG_TYPE.TEMP,FLAG_TEMP.GOSPEL_PASSIVE_BOOST,0))
}
name="{color_text `white`}"
if(Battle_GetAp()<ap_cost){
	name="{color_text `gray`}"
}
name+="Iron Whip"
if(Flag_Get(FLAG_TYPE.TEMP,FLAG_TEMP.GOSPEL_PASSIVE_BOOST,0)>=1){
	name+="+"+string(Flag_Get(FLAG_TYPE.TEMP,FLAG_TEMP.GOSPEL_PASSIVE_BOOST,0))
	name+=" {color_text `white`}[{color_text `specaqua`}"+string(ap_cost)+"{color_text `white`}]"
}else{
	name+="  {color_text `white`}[{color_text `specaqua`}"+string(ap_cost)+"{color_text `white`}]"
}
info="Gospel deals {color_text `specred`}"+string(damage)+"{color_text `white`} damage and&applies {color_text `specred`}1 Vulnerable{color_text `white`} to an enemy."
power_info_zero="Use this skill normally."
power_info="{color_text `specgold`}PASSIVE: Power Boost&{color_text `white`}Boost damage to {color_text `specred`}"+string(damage)+"{color_text `white`}! (Will cost {color_text `specaqua`}"+string(ap_cost)+"{color_text `white`} AP.)"
text="* Gospel used "+use_name+"{color_text `white`}!{pause}{end}"
deals_dmg=1;
target="ENEMY";
_done=false;
_no_ap=false;
Battle_SetMenuFightAnimTime(30);
Battle_SetMenuFightDamageTime(45);
Battle_SetMenuFightDamage(damage);
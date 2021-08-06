var add_passive=Flag_Get(FLAG_TYPE.TEMP,FLAG_TEMP.WHIMSIE_PASSIVE_ACTIVE,0);
if(add_passive>=2){
	add_passive=0;
}
ap_cost=Flag_Get(FLAG_TYPE.TEMP,FLAG_TEMP.WHIMSIE_BOMB_FUSE+add_passive,1);
fuse=Flag_Get(FLAG_TYPE.TEMP,FLAG_TEMP.WHIMSIE_BOMB_FUSE+add_passive,1);
use_name="{color_text `whimsie`}Black Bomb"
name="{color_text `white`}"
if(Battle_GetAp()-battle._last_ap<ap_cost){
	name="{color_text `gray`}"
}
name+="Black Bomb{color_text `white`}[{color_text `specaqua`}"+string(ap_cost)+"{color_text `white`}]"
info="Whimsie throws a bomb that will&deal {color_text `specred`}"+string(fuse*2)+" DMG{color_text `white`} upon detonation.&The bomb will have a Fuse of "+string(fuse)+"."
text="* Whimsie threw a "+use_name+"{color_text `white`}!&* It'll explode in {color_text `whimsie`}"+string(fuse)+" turns{color_text `white`}!{pause}{end}"
power_info="{color_text `specgold`}PASSIVE: Fast Arms&{color_text `white`}Throw an extra bomb in the&same turn! {color_text `specred`}("+string(fuse*2)+" DMG){color_text `white`}"
damage=2;
deals_dmg=1;
target="ALL";
_done=false;
_no_ap=false;
is_bomb=true;
Battle_SetMenuFightAnimTime(30);
Battle_SetMenuFightDamageTime(45);
Battle_SetMenuFightDamage(damage);
bomb_x[0]=400
bomb_x[1]=250
bomb_x[2]=450
bomb_x[3]=200
bomb_x[4]=500
bomb_x[5]=150
bomb_x[6]=550
bomb_x[7]=100
number=instance_number(battle_skill_bomb)
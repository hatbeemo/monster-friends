ap_cost=1;
fuse=2;
use_name="{color_text `whimsie`}Black Bomb"
name="Black Bomb[{color_text `specaqua`}1{color_text `white`}]"
info="Whimsie throws a bomb that will&deal {color_text `specred`}"+string(fuse*2)+" DMG{color_text `white`} upon detonation.&The bomb will have a Fuse of "+string(fuse)+"."
text="* Whimsie threw a "+use_name+"{color_text `white`}!&* It'll explode in {color_text `whimsie`}"+string(fuse)+" turns{color_text `white`}!{pause}{end}"
damage=2;
deals_dmg=1;
target="ALL";
_done=false;
_no_ap=false;
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
number=Battle_GetTurnNumber();
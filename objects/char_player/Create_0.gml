event_inherited();
//I want a variable called char_id, and make it 0!
char_id=0;

//Array name [position within array] = initialize array to this sprite
//I want to store this set of sprites in this position of the array!
res_idle_sprite[DIR.UP]=spr_char_bonnie_u;
res_idle_sprite[DIR.DOWN]=spr_char_bonnie_d;
res_idle_sprite[DIR.LEFT]=spr_char_bonnie_r;
res_idle_sprite[DIR.RIGHT]=spr_char_bonnie_r;
res_move_sprite[DIR.UP]=spr_char_bonnie_u;
res_move_sprite[DIR.DOWN]=spr_char_bonnie_d;
res_move_sprite[DIR.LEFT]=spr_char_bonnie_r;
res_move_sprite[DIR.RIGHT]=spr_char_bonnie_r;

//These variables are surprise tools that will help us later!
moveable=true;
_moveable_dialog=true;
_moveable_menu=true;
_moveable_save=true;
_moveable_warp=true;
_moveable_encounter=true;
_moveable_box=true;
_can_menu=true;

_run_accel=0;
_run_timer=0;


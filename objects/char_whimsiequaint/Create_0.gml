event_inherited();

dir_locked=false;

res_idle_sprite[DIR.UP]=spr_char_whimsie_u_idle;
res_idle_sprite[DIR.DOWN]=spr_char_whimsie_d_idle;
res_idle_sprite[DIR.LEFT]=spr_char_whimsie_r_idle;
res_idle_sprite[DIR.RIGHT]=spr_char_whimsie_r_idle;

res_talk_sprite[DIR.UP]=spr_char_whimsie_u_idle;
res_talk_sprite[DIR.DOWN]=spr_char_whimsie_d_idle;
res_talk_sprite[DIR.LEFT]=spr_char_whimsie_r_idle;
res_talk_sprite[DIR.RIGHT]=spr_char_whimsie_r_idle;


var spd=1/3;
res_idle_speed[0]=spd;
res_idle_speed[90]=spd;
res_idle_speed[180]=spd;
res_idle_speed[270]=spd;

res_move_speed[0]=spd;
res_move_speed[90]=spd;
res_move_speed[180]=spd;
res_move_speed[270]=spd;

res_talk_speed[0]=spd;
res_talk_speed[90]=spd;
res_talk_speed[180]=spd;
res_talk_speed[270]=spd;

dialogue = 0;
event_inherited();

dir_locked=false;
dialogue = 0;

talking=false;
ready=false;

res_idle_sprite[DIR.UP]=spr_char_mopsy_u;
res_idle_sprite[DIR.DOWN]=spr_char_mopsy_d;
res_idle_sprite[DIR.LEFT]=spr_char_mopsy_r;
res_idle_sprite[DIR.RIGHT]=spr_char_mopsy_r;

res_talk_sprite[DIR.UP]=spr_char_mopsy_u
res_talk_sprite[DIR.DOWN]=spr_char_mopsy_down_talk
res_talk_sprite[DIR.LEFT]=spr_char_mopsy_right_talk
res_talk_sprite[DIR.RIGHT]=spr_char_mopsy_right_talk

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

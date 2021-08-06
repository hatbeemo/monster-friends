var hp_orig=_hp;

_hp=(_hp-enemy_damage_deal >= 0 ? _hp-enemy_damage_deal : 0);

//Create damage number
var inst=instance_create_depth(x,y-160,0,battle_damage);
inst.damage=enemy_damage_deal;
inst.bar_hp_max=_hp_max;
inst.bar_hp_original=hp_orig;
inst.bar_hp_target=_hp;
inst.bar_width=200;

//Play damage sound and shake
if(enemy_damage_deal>0){
	audio_stop_sound(snd_damage);
	audio_play_sound(snd_damage,0,false);
	image_index=1;
	_damage_timer=50;
	var shake=instance_create_depth(0,0,0,shaker);
	shake.target=self;
	shake.var_name="x";
	shake.shake_distance=15;
	shake.shake_decrease=3;
	shake.shake_speed=4;
}
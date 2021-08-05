var dmg=enemy_damage_deal;
var hp_orig=_hp;

_hp=(_hp-dmg >= 0 ? _hp-dmg : 0);

//Create damage number
var inst=instance_create_depth(x,y-80,0,battle_damage);
inst.damage=dmg;
inst.bar_hp_max=_hp_max;
inst.bar_hp_original=hp_orig;
inst.bar_hp_target=_hp;
inst.bar_width=300;

//Play damage sound and shake
if(dmg>0){
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
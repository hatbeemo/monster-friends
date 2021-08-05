///@desc Turn Preparation Start
//Prepare the attack
var sound = choose(snd_autoriel_scream1,snd_autoriel_scream2,snd_autoriel_scream3)
var text = "{voice 0}{speed 3}{char_per_frame 3}* "
text += choose("OOAAAAAAAARRR-BZZZTT!!","BZZZZZOOOOAAAAAAA!!!","OOAAAAAA!!!","BZZZOAAAA!")
text += "{pause}{end}"
/*if(Battle_GetTurnNumber()==1)&&_did_special==0
{
	text = "{voice 0}{speed 3}{char_per_frame 3}* OOAAAAAAAAAAAAAA!!!{pause}{end}"
	sound = choose(snd_autoriel_ultrascream1,snd_autoriel_ultrascream2)
	audio_play_sound(snd_special_obtain,0,false);
	specatk = instance_create_depth(0,0,0,battle_attack_special_overclock);
	specatk.attack_priority=0;
}else*/{
	audio_play_sound(snd_enemy_atk,0,false);
	first = instance_create_depth(0,0,0,battle_attack_test);
	first.attack_priority=0;
	second = instance_create_depth(0,0,0,battle_attack_test2);
	second.attack_priority=1;
}
audio_play_sound(sound,0,false)
//Say something
Battle_SetDialog(text)
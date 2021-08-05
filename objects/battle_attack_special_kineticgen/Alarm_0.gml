attacking=false
//audio_play_sound(snd_kineticgen,0,false);
if(battle_enemy_autoriel.enemy_ailments==-1){
	battle_enemy_autoriel.enemy_ailments=[13]
}else{
	array_push(battle_enemy_autoriel.enemy_ailments,13)
}
if(battle_enemy_autoriel.enemy_ailment_numbers==-1){
	battle_enemy_autoriel.enemy_ailment_numbers=[0]
}else{
	array_push(battle_enemy_autoriel.enemy_ailment_numbers,0)
}
with(battle_enemy_autoriel){
	_did_special=2;
}
Battle_SetDialog("* Something revs up from within&  the AUTORIEL's body!{pause}{end}");
_done=1;
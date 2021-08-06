///@desc Destroy
audio_stop_sound(snd_spike_disable)
audio_play_sound(snd_spike_disable,0,false)
audio_stop_sound(snd_explosion)
audio_play_sound(snd_explosion,0,false)
with(battle_skill_bomb){
	index-=1	
}
done=4;
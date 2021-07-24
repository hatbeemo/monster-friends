audio_play_sound(snd_noise,0,false);
fader.alpha=0;
char_player.moveable=true;
camera.target=noone;
Anim_Create(camera,"x",ANIM_TWEEN.SINE,ANIM_EASE.OUT,camera.x,100,90);
instance_create_depth(char_player.x+70,char_player.y,0,char_mopsy);
alarm[2]=60;
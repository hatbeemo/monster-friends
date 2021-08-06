event_inherited();
audio_play_sound(snd_item_heal,0,false)
battle_enemy_gospel.new_color=LTAQUA_COLOR;
battle_enemy_gospel.color_timer=2.5;
var has_vulnerable=0;
with(battle_enemy_gospel){
	var proc=0;
	if(enemy_ailments!=-1){
		repeat(array_length(enemy_ailments)){
			if(enemy_ailments[proc]==1){
				has_vulnerable=1
				enemy_ailment_numbers[proc]+=1;
			}
			proc+=1
		}
	}
}
if(!has_vulnerable){
	if(battle_enemy_gospel.enemy_ailments==-1){
		battle_enemy_gospel.enemy_ailments=[1]
	}else{
		array_push(battle_enemy_gospel.enemy_ailments,1)
	}
	if(battle_enemy_gospel.enemy_ailment_numbers==-1){
		battle_enemy_gospel.enemy_ailment_numbers=[1]
	}else{
		array_push(battle_enemy_gospel.enemy_ailment_numbers,1)
	}
}
Flag_Set(FLAG_TYPE.TEMP,FLAG_TEMP.ENEMY_AP,Flag_Get(FLAG_TYPE.TEMP,FLAG_TEMP.ENEMY_AP,0)+3)
text = "* Gospel recovered {color_text `specaqua`}3 AP{color_text `white`}!&* Gospel gained {color_text `specred`}1 Vulnerable{color_text `white`}!{pause}{end}"
Battle_SetDialog(text);
if(attack_priority==1){
	Anim_Create(battle_ui,"incoming_y2",ANIM_TWEEN.SINE,ANIM_EASE.IN,battle_ui.incoming_y2,100,25,0)
}else{
	Anim_Create(battle_ui,"incoming_y",ANIM_TWEEN.SINE,ANIM_EASE.IN,battle_ui.incoming_y,100,25,0)
}
instance_destroy();
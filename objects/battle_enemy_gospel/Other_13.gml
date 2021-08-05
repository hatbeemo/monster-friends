///@desc Menu Switch
///@desc Menu Switch

switch(Battle_GetMenu()){
	case BATTLE_MENU.SKILL_TARGET:
		//Create enemy's hp bar
		var inst=instance_create_depth(0,0,0,battle_menu_fight_hp_bar);
		inst.enemy_slot=_enemy_slot;
		inst.hp_max=_hp_max;
		inst.hp=_hp;
		inst.color=GOSPEL_COLOR;
		//Also create ailment icons
		if(enemy_ailments!=-1){
			var inst=instance_create_depth(0,0,0,battle_menu_fight_ailments);
			inst.enemy_slot=_enemy_slot;
			inst.ailment_list=enemy_ailments
			inst.ailment_numbers=enemy_ailment_numbers
			inst.ailment_max=array_length(enemy_ailments)
		}
		break;

	case BATTLE_MENU.CHECK_TARGET:
		//Create ailment icons
		if(enemy_ailments!=-1){
			var inst=instance_create_depth(0,0,0,battle_menu_fight_ailments);
			inst.enemy_slot=_enemy_slot;
			inst.ailment_list=enemy_ailments
			inst.ailment_numbers=enemy_ailment_numbers
			inst.ailment_max=array_length(enemy_ailments)
		}
		break;
		
	case BATTLE_MENU.SKILL_DAMAGE:
		if(Battle_ConvertMenuChoiceEnemyToEnemySlot(Battle_GetMenuChoiceEnemy())==_enemy_slot){
			var dmg=Battle_GetMenuFightDamage();
			var hp_orig=_hp;
		
			_hp=(_hp-dmg >= 0 ? _hp-dmg : 0);
		
			//Create damage number
			var inst=instance_create_depth(x,y-160,0,battle_damage);
			inst.damage=dmg;
			inst.bar_hp_max=_hp_max;
			inst.bar_hp_original=hp_orig;
			inst.bar_hp_target=_hp;
			inst.bar_width=200;
		
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
		}
		break;
}
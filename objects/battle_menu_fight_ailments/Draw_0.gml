var DIALOG=battle._dialog[0];

if(instance_exists(DIALOG)){
	var SLOT=Battle_ConvertEnemySlotToMenuChoiceEnemy(enemy_slot);
	if(player_mode){
		SLOT=enemy_slot
	}
	if(instance_exists(battle_menu_fight_hp_bar)){
		with(battle_menu_fight_hp_bar){
			if(enemy_slot==other.enemy_slot)
			{
				other.width=width	
			}
		}
		X=493-35-width;
	}
	var Y=374-2+36*SLOT;
	var proc=0;
	repeat(ailment_max){
		if(player_mode){
			if(ds_list_find_value(ailment_list,proc)>0){
				draw_sprite_ext(spr_battle_menu_ailments,0,X-(30*proc),Y,1,1,0,_ailment_colors[ds_list_find_value(ailment_list,proc)],1)
				draw_sprite_ext(spr_battle_menu_ailments,ds_list_find_value(ailment_list,proc),X-(30*proc),Y,1,1,0,_ailment_colors[ds_list_find_value(ailment_list,proc)],1)
				if(ds_list_find_value(ailment_numbers,proc)>0){
					draw_sprite_ext(spr_battle_menu_ailmentnumber,ds_list_find_value(ailment_numbers,proc),X-(30*proc),Y+28,1,1,0,_ailment_colors[ds_list_find_value(ailment_list,proc)],1)
				}
			}
		}else{
			if(ailment_list[proc]>0){
				draw_sprite_ext(spr_battle_menu_ailments,0,X-(30*proc),Y,1,1,0,_ailment_colors[ailment_list[proc]],1)
				draw_sprite_ext(spr_battle_menu_ailments,ailment_list[proc],X-(30*proc),Y,1,1,0,_ailment_colors[ailment_list[proc]],1)
				if(ailment_numbers[proc]>0){
					draw_sprite_ext(spr_battle_menu_ailmentnumber,ailment_numbers[proc],X-(30*proc),Y+28,1,1,0,_ailment_colors[ailment_list[proc]],1)
				}
			}
		}
		proc+=1
	}
}
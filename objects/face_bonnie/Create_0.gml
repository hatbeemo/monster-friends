/// @description Insert description here
// You can write your code in this editor

// Inherit the parent event
event_inherited();

idle_sprite=[
spr_char_bonnie_faceidle_annoyed,		//0
spr_char_bonnie_faceidle_blank,			//1
spr_char_bonnie_faceidle_blush,			//2
spr_char_bonnie_faceidle_comtempt,		//3
spr_char_bonnie_faceidle_confident,		//4
spr_char_bonnie_faceidle_confuse,		//5
spr_char_bonnie_faceidle_determined,	//6
spr_char_bonnie_faceidle_eyesopensmile,	//7
spr_char_bonnie_faceidle_flirt,			//8
spr_char_bonnie_faceidle_flushed,		//9
spr_char_bonnie_faceidle_huh,			//10
spr_char_bonnie_faceidle_joyed,			//11
spr_char_bonnie_faceidle_neutral,		//12
spr_char_bonnie_faceidle_pissed,		//13
spr_char_bonnie_faceidle_shocked,		//14
spr_char_bonnie_faceidle_solemnsmile,	//15
spr_char_bonnie_faceidle_sulk,			//16
spr_char_bonnie_faceidle_surprised,		//17
spr_char_bonnie_faceidle_tiredmad,		//18
spr_char_bonnie_faceidle_worried,		//19
];
talk_sprite=[
spr_char_bonnie_faceidle_annoyed,		//0
spr_char_bonnie_faceidle_blank,			//1
spr_char_bonnie_faceidle_blush,			//2
spr_char_bonnie_faceidle_comtempt,		//3
spr_char_bonnie_faceidle_confident,		//4
spr_char_bonnie_faceidle_confuse,		//5
spr_char_bonnie_faceidle_determined,	//6
spr_char_bonnie_faceidle_eyesopensmile,	//7
spr_char_bonnie_faceidle_flirt,			//8
spr_char_bonnie_faceidle_flushed,		//9
spr_char_bonnie_faceidle_huh,			//10
spr_char_bonnie_faceidle_joyed,			//11
spr_char_bonnie_faceidle_neutral,		//12
spr_char_bonnie_faceidle_pissed,		//13
spr_char_bonnie_faceidle_shocked,		//14
spr_char_bonnie_faceidle_solemnsmile,	//15
spr_char_bonnie_faceidle_sulk,			//16
spr_char_bonnie_faceidle_surprised,		//17
spr_char_bonnie_faceidle_tiredmad,		//18
spr_char_bonnie_faceidle_worried,		//19
];
for(i=0;i<array_length(idle_sprite);i++)
{
	idle_image[i]=0;
	talk_image[i]=1;
	idle_speed[i]=0;
	talk_speed[i]=1/4;
}
face_id=3;
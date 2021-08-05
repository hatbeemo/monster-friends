/// @description Insert description here
// You can write your code in this editor

// Inherit the parent event
event_inherited();

//Normal
idle_sprite=[
spr_char_mopsy_faceidle_normal,
spr_char_mopsy_faceidle_happy,
];
idle_sprite=[
spr_char_mopsy_facetalk_normal,
spr_char_mopsy_facetalk_happy,
];
for(i=0;i<array_length(idle_sprite);i++)
{
	idle_image[i]=0;
	talk_image[i]=1;
	idle_speed[i]=0;
	talk_speed[i]=1/2;
}
face_id=3;
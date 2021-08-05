/// @description Insert description here
// You can write your code in this editor

// Inherit the parent event
event_inherited();

//Normal
//Normal
idle_sprite=[
spr_fidle_whimsie_normal,
spr_fidle_whimsie_focus,
spr_fidle_whimsie_shock,
];
talk_sprite=[
spr_ftalk_whimsie_normal,
spr_ftalk_whimsie_focus,
spr_ftalk_whimsie_shock,
];
for(i=0;i<array_length(idle_sprite);i++)
{
	idle_image[i]=0;
	talk_image[i]=1;
	idle_speed[i]=0;
	talk_speed[i]=1/2;
}
face_id=3;
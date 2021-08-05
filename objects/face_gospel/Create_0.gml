/// @description Insert description here
// You can write your code in this editor

// Inherit the parent event
event_inherited();

//Normal
//Normal
idle_sprite=[
spr_fidle_gospel1,
spr_fidle_gospel2,
spr_fidle_gospel3,
spr_fidle_gospel4,
spr_fidle_gospel5,
spr_fidle_gospel6,
spr_fidle_gospel7,
spr_fidle_gospel8,
spr_fidle_gospel9,
spr_fidle_gospel10,
];
talk_sprite=[
spr_fidle_gospel1,
spr_fidle_gospel2,
spr_fidle_gospel3,
spr_fidle_gospel4,
spr_fidle_gospel5,
spr_fidle_gospel6,
spr_fidle_gospel7,
spr_fidle_gospel8,
spr_fidle_gospel9,
spr_fidle_gospel10,
];
for(i=0;i<array_length(idle_sprite);i++)
{
	idle_image[i]=0;
	talk_image[i]=1;
	idle_speed[i]=0;
	talk_speed[i]=1/4;
}
face_id=3;
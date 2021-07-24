/// @description Insert description here
// You can write your code in this editor

// Inherit the parent event
event_inherited();

if (!instance_exists(ui_dialog)&&ready==true){
    alarm[0]=1;
    ready=false;
	talking=false;
}
if(color_timer>0){
	image_blend=merge_color(c_white,new_color,clamp(color_timer,0,1));
	color_timer-=0.05;
}else{
	image_blend=c_white
}
var face_sprite = spr_fidle_gospel1
if(image_index==1){
	var face_sprite = spr_fidle_gospel3
}
if(image_index==2){
	var face_sprite = spr_fidle_gospel4
}
var face_index = 0
if(instance_exists(face_gospel)){
	face_sprite=face_gospel.sprite_index
	face_index=face_gospel.image_index
}
draw_sprite_ext(face_sprite,face_index,x-9,y-66,2,2,0,image_blend,image_alpha)
draw_self()
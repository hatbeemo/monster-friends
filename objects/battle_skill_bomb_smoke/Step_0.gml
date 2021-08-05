timer += 1
if (timer > 30)
{
    image_alpha -= 0.01
    if (image_alpha <= 0){
        instance_destroy()
	}
}else{
	image_alpha += 0.015
    if (image_alpha >= 0.5){
		image_alpha = 0.5
	}
}
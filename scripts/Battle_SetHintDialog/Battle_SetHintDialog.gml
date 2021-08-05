///@arg text*
///@arg choice*
///@arg line2*
function Battle_SetHintDialog() {
	var TEXT="";
	if(argument_count>=1){
		TEXT=argument[0];
	}

	//销毁原实例
	if(instance_exists(battle._hint_dialog)){
		instance_destroy(battle._hint_dialog);
	}

	if(TEXT!=""){
		//创建实例
		var tx=20;
		var ty=12;
		battle._hint_dialog=instance_create_depth(tx,ty,0,text_typer);
	
		//更改文字
		var text_prefix="{scale 2}{voice 1}{speed 2}{shadow false}{gui false}{depth "+string(DEPTH_BATTLE.UI_HIGH)+"}{instant true}";
		battle._hint_dialog.text=text_prefix+TEXT;
		return battle._hint_dialog;
	}else{
		return noone;
	}


}

///@arg string
function GetColorFromString() {
	var STR=argument[0];

	var color=c_white;
	switch(STR){
		case "white":
			color=c_white;
			break;
		case "black":
			color=c_black;
			break;
		case "red":
			color=c_red;
			break;
		case "yellow":
			color=c_yellow;
			break;
		case "specred":
			color=RED_COLOR;
			break;
		case "speclime":
			color=LIME_COLOR;
			break;
		case "specgold":
			color=GOLD_COLOR;
			break;
		case "specaqua":
			color=LTAQUA_COLOR;
			break;
		case "specaqua2":
			color=AQUA_COLOR;
			break;
		case "specdlaqua":
			color=DULLAQUA_COLOR;
			break;
		case "whimsie":
			color=WHIMSIE_COLOR;
			break;
		case "gospel":
			color=GOSPEL_COLOR;
			break;
		case "mopsy":
			color=MOPSY_COLOR;
			break;
		case "toadie":
			color=TOADIE_COLOR;
			break;
		case "autoriel":
			color=AUTORIEL_COLOR;
			break;
		case "gray":
			color=c_gray;
			break;
		case "gray_dark":
			color=c_dkgray;
			break;
		case "gray_light":
			color=c_ltgray;
			break;
	}
	return color;


}

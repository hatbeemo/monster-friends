if(room==room_endscreen_lose){
	Battlelog_Add("----------------------------\n\nBATTLE OVER\nGospel wins!\nGospel HP: "+string(global.gospel_hp)+"/20\nTurns lasted: "+string(global.turns_lasted))
	won=false;
	text="GAME OVER"
	retry_text[0]="Press Z or ENTER to retry."
}else{
	Battlelog_Add("----------------------------\n\nBATTLE OVER\nWhimsie wins!\nWhimsie HP: "+string(global.gospel_hp)+"/20\nTurns lasted: "+string(global.turns_lasted))
	won=true;
	text="YOU WON"
	retry_text[0]="Press Z or ENTER to play again."
}
retry_text[1]="Press X or Shift to return to the menu."
retry_text[2]="Press C to download a battle log!"
current_tip = 0
tips[0]="* Gospel will try to destroy your\n  bombs if you throw more than\n  1 AND if he has enough AP!"
tips[1]="* The Vulnerable status effect\n  increases DMG received by x1.5!"
tips[2]="* Gospel can deal up to 8 DMG\n  with enough AP and if you're\n  Vulnerable!"
tips[3]="* Gospel becomes Vulnerable when\n  using his Recharge and his\n  SPECIAL, Power Surge!"
alarm[0] = 480
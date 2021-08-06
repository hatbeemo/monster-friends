if(room==room_endscreen_lose){
	won=false;
	text="GAME OVER"
}else{
	won=true;
	text="YOU WON"	
}
current_tip = irandom(3)
tips[0]="* Gospel will try to destroy your\n  bombs if you throw more than\n  1 AND if he has enough AP!"
tips[1]="* The Vulnerable status effect\n  increases DMG received by x1.5!"
tips[2]="* Gospel can deal up to 8 DMG\n  with enough AP and if you're\n  Vulnerable!"
tips[3]="* Gospel becomes Vulnerable when\n  using his Recharge and his\n  SPECIAL, Power Surge!"
alarm[0] = 480
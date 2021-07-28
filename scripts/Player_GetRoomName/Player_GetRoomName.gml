///@arg room
function Player_GetRoomName() {
	var ROOM=argument[0];

	var name="";

	switch(ROOM){
		case -1:
			name="--";
			break;
		case room_sn_main:
			name="Snowdin - Town";
			break;
		case room_sn_north:
			name="Snowdin - Town (North)";
			break;
		case room_sn_dark_right:
			name="Snowdin - Cave (East)";
			break;
		case room_sn_dark_left:
			name="Snowdin - Cave (West)";
			break;
		case room_sn_dark_happy:
			name="Snowdin - you shouLDN'T SEE THIS THE GAME DOESN'T EVEN GIVE YOU CONTROL HERE WHAT THE DOG ARE YOU DOING";
			break;
	}
	return name;


}

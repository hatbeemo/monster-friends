/// @description Insert description here
// You can write your code in this editor
if(Input_IsHeld(INPUT.CANCEL)){
    move_speed[DIR.UP]=3;
    move_speed[DIR.DOWN]=3;
    move_speed[DIR.LEFT]=3;
    move_speed[DIR.RIGHT]=3;
    res_move_speed[DIR.UP]=1/2;
    res_move_speed[DIR.DOWN]=1/2;
    res_move_speed[DIR.LEFT]=1/2;
    res_move_speed[DIR.RIGHT]=1/2;
}else if(!Input_IsHeld(INPUT.CANCEL)){
    move_speed[DIR.UP]=2;
    move_speed[DIR.DOWN]=2;
    move_speed[DIR.LEFT]=2;
    move_speed[DIR.RIGHT]=2;
    res_move_speed[DIR.UP]=1/3;
    res_move_speed[DIR.DOWN]=1/3;
    res_move_speed[DIR.LEFT]=1/3;
    res_move_speed[DIR.RIGHT]=1/3;
}
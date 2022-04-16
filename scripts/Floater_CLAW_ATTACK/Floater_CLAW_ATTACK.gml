// Script assets have changed for v2.3.0 see
// https://help.yoyogames.com/hc/en-us/articles/360005277377 for more information
function Floater_CLAW_ATTACK(){
	c_vel_x = 0;
	c_vel_y = 0;
	sprite_index = sClawFloater;
	
	mask_index = mClawFloater;
	if(place_meeting(x,y,oPlayer)&&!dealtDMG){
		dealtDMG=true;
		oPlayer.hp--;
		show_debug_message(oPlayer.hp);
	}
	mask_index=sClawFloater;
	
	var _type=sprite_get_speed_type(sprite_index);
	var _spd=sprite_get_speed(sprite_index)*image_speed;
	if(_type == spritespeed_framespersecond)
		_spd = _spd/room_speed;
	if(image_index+_spd >= sprite_get_number(sprite_index)){
		movment = FloaterState.CHASE;
		dealtDMG = false;
		sprite_index = sIdleFloater;
	}

}
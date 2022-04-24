// Script assets have changed for v2.3.0 see
// https://help.yoyogames.com/hc/en-us/articles/360005277377 for more information
function Floater_CLAW_ATTACK(){
	c_vel_x = 0;
	c_vel_y = 0;
	sprite_index = sFloaterClaw;
	
	mask_index = mFloaterClaw;
	if(place_meeting(x,y,global.player)&&!dealtDMG){
		dealtDMG=true;
		global.player.hp--;
		global.player.movment = PlayerState.HIT;
		show_debug_message(global.player.hp);
		global.player.lastHitT = current_time;
	}
	mask_index=sFloaterChase;
	
	var _type=sprite_get_speed_type(sprite_index);
	var _spd=sprite_get_speed(sprite_index)*image_speed;
	if(_type == spritespeed_framespersecond)
		_spd = _spd/room_speed;
	if(image_index+_spd >= sprite_get_number(sprite_index)){
		movment = FloaterState.CHASE;
		dealtDMG = false;
		sprite_index = sFloaterChase;
	}

}
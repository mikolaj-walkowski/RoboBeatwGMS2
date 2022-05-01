// Script assets have changed for v2.3.0 see
// https://help.yoyogames.com/hc/en-us/articles/360005277377 for more information
function Floater_HIT(){
	if(sprite_index == sFloaterHit){
		var _type=sprite_get_speed_type(sprite_index);
		var _spd=sprite_get_speed(sprite_index)*image_speed;
		if(_type == spritespeed_framespersecond)
			_spd = _spd/room_speed;
		if(image_index+_spd >= sprite_get_number(sprite_index)){
			if(hp<=0)
				movment = FloaterState.DEAD;
			else
				movment = FloaterState.CHASE;
			sprite_index =sFloaterChase;
		}
	}else{
		sprite_index = sFloaterHit;
		image_index = 0;
		c_vel_x = 0;
		c_vel_y = 0;
	}
}
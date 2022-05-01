// Script assets have changed for v2.3.0 see
// https://help.yoyogames.com/hc/en-us/articles/360005277377 for more information
function Player_HIT(){
	if(sprite_index == sPlayerHit){
		var _type=sprite_get_speed_type(sprite_index);
		var _spd=sprite_get_speed(sprite_index)*image_speed;
		if(_type == spritespeed_framespersecond)
			_spd = _spd/room_speed;
		if(image_index+_spd >= sprite_get_number(sprite_index)){
			movment = PlayerState.NORMAL;
			sprite_index =sPlayer;
		}	
	}else{
		sprite_index = sPlayerHit;
		image_index = 0;
	}
}
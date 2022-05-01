// Script assets have changed for v2.3.0 see
// https://help.yoyogames.com/hc/en-us/articles/360005277377 for more information
function Player_ATTACK(_dt){
	left = keyboard_check(ord("A"))
	right = keyboard_check(ord("D"))
	up = keyboard_check(ord("W"))
	down = keyboard_check(ord("S"))
	
	//Ustalanie kierunku w pionie dla dasza
	hdir = 0;
	h1 = gamepad_axis_value(0, gp_axislh);
	h1 = h1 > 0.15 || h1 <-0.15 ? h1 : 0;
	hdir += h1;
	hdir += right - left;

	vdir = 0;
	vdir += gamepad_button_check(0,gp_face2)- gamepad_button_check(0,gp_face1)
	vdir += down - up;
	
	c_vel_x = velo_h*hdir;//touching_b == 1 ? velo_h*hdir : (abs(c_vel_x) < 300 ? c_vel_x+_dt*velo_h*hdir : c_vel_x);
	c_vel_y += touching_b == 1 ? velo_v*vdir : 0;
	
	g = jump_normal;
	
	if(vdir<0 && c_vel_y <= 0)
		g = jump_hold;
		
	if(c_vel_y > 0)
		g = jump_fall;
		
	if(sprite_index == sPlayerAttack){
		mask_index = mPlayerAttack;
		var Hit = ds_list_create();
		instance_place_list(x,y,oEnemy,Hit,false);
		var _size = ds_list_size(Hit);
		for(var i = 0; i < _size ; i++){
			if(ds_list_find_index(currentHit,Hit[|i])==-1){
				ds_list_add(currentHit,Hit[|i]);
				Hit[|i].hp--;
				Hit[|i].movment = FloaterState.HIT;
			}
		}
		ds_list_destroy(Hit);
		mask_index= sPlayerAttack;
		var _type=sprite_get_speed_type(sprite_index);
		var _spd=sprite_get_speed(sprite_index)*image_speed;
		if(_type == spritespeed_framespersecond)
			_spd = _spd/room_speed;
		if(image_index+_spd >= sprite_get_number(sprite_index)){
			movment = PlayerState.NORMAL;
			sprite_index =sPlayer;
		}
	}else{
		ds_list_clear(currentHit);
		sprite_index = sPlayerAttack;
		image_index = 0;
	}
}
// Script assets have changed for v2.3.0 see
// https://help.yoyogames.com/hc/en-us/articles/360005277377 for more information
function Player_ATTACK(_dt){
		
	if(sprite_index == sPlayerAttack){
		inputs();
	
		c_vel_x = hdir*attack_speed;
	
		if(touching_b == 1 && jump_btn>0){
			c_vel_y = velo_v*-1;
			g = jump_hold;
		}
	
		if(jump_realese > 0 && c_vel_y <= 0)
			g = jump_normal;
		
		if(c_vel_y > 0)
			g = jump_fall;
		
		mask_index = mPlayerAttack;
		var Hit = ds_list_create();
		instance_place_list(x,y,oEnemy,Hit,false);
		var _size = ds_list_size(Hit);
		for(var i = 0; i < _size ; i++){
			if(ds_list_find_index(currentHit,Hit[|i])==-1){
				ds_list_add(currentHit,Hit[|i]);
				Hit[|i].takeDmg(currentDmg);
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
			current_state =current_state ^f_noautoflip;
			sprite_index =sPlayer;
		}
	}else{
		ds_list_clear(currentHit);
		sprite_index = sPlayerAttack;
		image_index = 0;
		current_state|= f_noautoflip;
		show_debug_message(current_state)
	}
}
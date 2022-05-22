// Script assets have changed for v2.3.0 see
// https://help.yoyogames.com/hc/en-us/articles/360005277377 for more information
function Player_DASH (){
	if(sprite_index != sPlayerDash2){
		sprite_set_speed(sPlayerDash2,sprite_get_number(sPlayerDash2)/(dash_curr_dur/1000),spritespeed_framespersecond);
		sprite_set_speed(sPlayerDash2OV,sprite_get_number(sPlayerDash2OV)/(dash_curr_dur/1000),spritespeed_framespersecond);
		sprite_index = sPlayerDash2;
		image_index = 0;
		iframe_start=current_time;
	}
	
	if(dash_start + dash_curr_dur < current_time || collision){
		c_vel_x = velo_h * dash_dir_x;
		c_vel_y = velo_v * dash_dir_y;
		i_vel_x = velo_v * dash_dir_x;
		sprite_index = sPlayer;	
		movment = PlayerState.NORMAL;
		playerOnBeat= false;
		dash_curr_dur = dash_dur;
		current_state |= (f_gravity | f_xaccel );
	}
}
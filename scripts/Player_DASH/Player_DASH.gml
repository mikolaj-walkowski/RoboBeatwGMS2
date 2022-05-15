// Script assets have changed for v2.3.0 see
// https://help.yoyogames.com/hc/en-us/articles/360005277377 for more information
function Player_DASH(){
	if(sprite_index != sPlayerDash){
		sprite_index = sPlayerDash;
		image_index = 0;
		iframe_start=current_time;
	}
	
	if(dash_start + dash_dur < current_time){
		c_vel_x = velo_h * dash_dir_x;
		c_vel_y = velo_v * dash_dir_y;
		i_vel_x = velo_v * dash_dir_x;
		sprite_index =sPlayer;	
		movment = PlayerState.NORMAL;
		current_state |= (f_gravity | f_xaccel );
	}
}
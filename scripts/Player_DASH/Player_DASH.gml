// Script assets have changed for v2.3.0 see
// https://help.yoyogames.com/hc/en-us/articles/360005277377 for more information
function Player_DASH(){
	//part_emitter_region(global.P_system,dashEmmiter,x-30,x+30,y-30,y+30,ps_shape_rectangle,ps_distr_gaussian);
	//part_emitter_burst(global.P_system,global.pPlayerDash,dashEmmiter,5+irandom(5));
	if(dash_start + dash_dur < current_time){
		c_vel_x = velo_h * dash_dir_x;
		c_vel_y = velo_v * dash_dir_y;
		i_vel_x = velo_v * dash_dir_x;
			
		movment = PlayerState.NORMAL;
		current_state |= (f_gravity | f_xaccel);
	}
}
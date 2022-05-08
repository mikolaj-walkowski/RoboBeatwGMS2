// Script assets have changed for v2.3.0 see
// https://help.yoyogames.com/hc/en-us/articles/360005277377 for more information
function Player_NORMAL(_dt){
	//przechwytywanie klawiatury
	left = keyboard_check(ord("A"))
	right = keyboard_check(ord("D"))
	up = keyboard_check(ord("W"))
	down = keyboard_check(ord("S"))

	dash_btn = gamepad_button_check_pressed(0,gp_face2) + keyboard_check_pressed(vk_shift);
	jump_btn = gamepad_button_check_pressed(0,gp_face1) + keyboard_check_pressed(vk_space);
	jump_realese  = gamepad_button_check_released(0,gp_face1) + keyboard_check_released(vk_space);
	attack_btn = keyboard_check(ord("J")) + gamepad_button_check_pressed(0,gp_face3);

	//Ustalanie kierunku w pionie dla dasza
	var h1 = gamepad_axis_value(0, gp_axislh);
	h1 = h1 > 0.15 || h1 <-0.15 ? h1 : 0;
	hdir = h1;
	hdir += right - left;


	var h2 = gamepad_axis_value(0, gp_axislv);
	h2 = h2 > 0.15 || h2 < -0.15 ? h2 : 0;
	vdir = h2;
	vdir += down - up;

	
	c_vel_x = velo_h*hdir;
	
	if(touching_b == 1 && jump_btn>0){
		c_vel_y = velo_v*-1;
		g = jump_hold;
	}
	
	if(jump_realese > 0 && c_vel_y <= 0)
		g = jump_normal;
		
	if(c_vel_y > 0)
		g = jump_fall;

	if(dash_btn == 1 && dash_cnt > 0 && (hdir!=0 || vdir !=0)){
		
		var dash_dir_len = sqrt(vdir*vdir + hdir*hdir);
		
		dash_dir_x = hdir/dash_dir_len;
		dash_dir_y = vdir/dash_dir_len;
		//Nadaje prędkość na czas dasz-a 
		c_vel_x = dash_dir_x * dash_velo;
		c_vel_y = dash_dir_y * dash_velo;
		
		//Pomniejszam ilość dostępnych daszy
		dash_cnt-=1;
		dash_start = current_time; 
		movment = PlayerState.DASH;			
		current_state &= !(f_gravity|f_xaccel);
	}
	
	if(attack_btn ==1){
		movment = PlayerState.ATTACK;
	}
}
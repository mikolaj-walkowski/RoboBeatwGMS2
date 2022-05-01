// Script assets have changed for v2.3.0 see
// https://help.yoyogames.com/hc/en-us/articles/360005277377 for more information
function Player_NORMAL(_dt){
	//przechwytywanie klawiatury
	left = keyboard_check(ord("A"))
	right = keyboard_check(ord("D"))
	up = keyboard_check(ord("W"))
	down = keyboard_check(ord("S"))

	dash_btn = gamepad_button_check_pressed(0,gp_face2) + keyboard_check_pressed(vk_space);
	attack_btn = keyboard_check(ord("J"));

	//Ustalanie kierunku w pionie dla dasza
	hdir = 0;
	h1 = gamepad_axis_value(0, gp_axislh);
	h1 = h1 > 0.15 || h1 <-0.15 ? h1 : 0;
	hdir += h1;
	hdir += right - left;


	vdir = 0;
	vdir += gamepad_button_check(0,gp_face2)- gamepad_button_check(0,gp_face1)
	vdir += down - up;

	//Ustalanie kierunku w poziomie dla dasza
	h2 = gamepad_axis_value(0, gp_axislv);
	vdir_dash = h2 > 0.15 || h2 < -0.15 ? h2 : 0;
	vdir_dash += down - up;
	
	c_vel_x = velo_h*hdir;//touching_b == 1 ? velo_h*hdir : (abs(c_vel_x) < 300 ? c_vel_x+_dt*velo_h*hdir : c_vel_x);
	c_vel_y += touching_b == 1 ? velo_v*vdir : 0;
	
	g = jump_normal;
	
	if(vdir<0 && c_vel_y <= 0)
		g = jump_hold;
		
	if(c_vel_y > 0)
		g = jump_fall;

	if(dash_btn == 1 && dash_cnt > 0 && (hdir!=0 || vdir_dash !=0)){
		
		var dash_dir_len = sqrt(vdir_dash*vdir_dash + hdir*hdir);
		
		dash_dir_x = hdir/dash_dir_len;
		dash_dir_y = vdir_dash/dash_dir_len;
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
/// @description Insert description here
// You can write your code in this editor

// czas w sekundach

var _dt = delta_time / 1000000;

if(hp <= 0) movment = PlayerState.DEAD;

//przechwytywanie klawiatury
left = keyboard_check(ord("A"))
right = keyboard_check(ord("D"))
up = keyboard_check(ord("W"))
down = keyboard_check(ord("S"))

dash_btn = gamepad_button_check_pressed(0,gp_face2) + keyboard_check_pressed(vk_space);

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

dash_dir_len = sqrt(vdir_dash*vdir_dash + hdir*hdir);

dash_cnt = touching_b == 1 ? 1 : dash_cnt;

switch(movment){
	case PlayerState.NORMAL:
		
		c_vel_x = touching_b == 1 ? velo_h*hdir : (abs(c_vel_x) < 200 ? c_vel_x+_dt*velo_h*hdir : c_vel_x);
		c_vel_y += touching_b == 1 ? velo_v*vdir : 0;
		

		if(dash_btn == 1 && dash_cnt > 0 && dash_dir_len != 0){
	
			//Zapamiętuje prędkość startową
			dash_dir_x = hdir/dash_dir_len;
			dash_dir_y = vdir_dash/dash_dir_len;
			//angle = arctan(dash_dir_x/dash_dir_y)
			//part_type_orientation(global.pPlayerDash,angle,angle,0,0,false);
			//Nadaje prędkość na czas dasz-a 
			c_vel_x = dash_dir_x * dash_velo;
			c_vel_y = dash_dir_y * dash_velo;
		
			
			//Pomniejszam ilość dostępnych daszy
			dash_cnt-=1;
			dash_start = current_time; 
			movment = PlayerState.DASH;			
			current_state &= !f_gravity;
		}
		break;
	case PlayerState.DASH:
	//part_emitter_region(global.P_system,dashEmmiter,x-30,x+30,y-30,y+30,ps_shape_rectangle,ps_distr_gaussian);
	//part_emitter_burst(global.P_system,global.pPlayerDash,dashEmmiter,5+irandom(5));
	if(dash_start + dash_dur < current_time){
			c_vel_x = velo_h * dash_dir_x;
			c_vel_y = velo_v * dash_dir_y;
			
			movment = PlayerState.NORMAL;
			current_state |= f_gravity;
	}
	break;
	case PlayerState.DEAD:
	
	break;
}

//Odpalam event dla funkcji rodzica 
event_inherited();




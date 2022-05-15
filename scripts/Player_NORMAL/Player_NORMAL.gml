// Script assets have changed for v2.3.0 see
// https://help.yoyogames.com/hc/en-us/articles/360005277377 for more information
function Player_NORMAL(_dt){
	//przechwytywanie klawiatury

	inputs();
	
	c_vel_x = velo_h*hdir;
	
	if(touching_b == 0){
		sprite_index = sPlayerFall;
	}
	
	if(touching_b == 1){
		if(i_vel_x == 0){
			sprite_index = sPlayer;	
		}else{
			sprite_index= sPlayerWalk;
		}
	}
	
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
		dash_start = current_time; 
		if(oSoundManager.beat_window){
			dash_start += 75;
			oHud.playerOnBeat = current_time;
		}
		
		//Pomniejszam ilość dostępnych daszy
		dash_cnt-=1;
		
		movment = PlayerState.DASH;			
		current_state &= ~(f_gravity|f_xaccel);
		show_debug_message(current_state)
	}
	
	if(attack_btn ==1){
		currentDmg = 1;
		if(oSoundManager.beat_window){
			currentDmg += 1;
			show_debug_message("On beat");
			oHud.playerOnBeat = current_time;
		}
		movment = PlayerState.ATTACK;
	}
}
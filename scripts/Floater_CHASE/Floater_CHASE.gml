// Script assets have changed for v2.3.0 see
// https://help.yoyogames.com/hc/en-us/articles/360005277377 for more information
function Floater_CHASE(_dt){
	if(instance_exists(global.player)){
		target_x = global.player.x;
		target_y = global.player.y - 65;

		dir_x = target_x - x;
		dir_y = target_y - y;
	
		if(abs(dir_x) < 25 && abs(dir_y)<10 && oSoundManager.beat){
			movment = FloaterState.CLAW_ATTACK;
			image_index = 0;
			c_vel_x = 0;
			c_vel_y = 0;
			return;
		}

		len = sqrt(dir_x*dir_x + dir_y*dir_y);
		beat_t_s = (oSoundManager.beat_T)/1000;
		var velo_help = 1/2 * velo * beat_t_s > len ? (2*len)/beat_t_s : velo;
		dir_x /= len;
		dir_y /= len;
		if(oSoundManager.beat){
			c_vel_x = velo_help*dir_x;
			c_vel_y = velo_help*dir_y;
		}else{
			c_vel_x *=1 - (1/beat_t_s)*_dt;
			c_vel_y *=1 - (1/beat_t_s)*_dt;	
		}
	}
}
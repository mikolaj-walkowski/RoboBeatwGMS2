// Script assets have changed for v2.3.0 see
// https://help.yoyogames.com/hc/en-us/articles/360005277377 for more information
function Floater_PATROL(_dt){
	if(instance_exists(global.player)){
		var dx = x - global.player.x;
		var dy = y - global.player.y;
		var vTarget_dist = sqrt((dx*dx) + (dy*dy));
		if(vTarget_dist < patrolRadius){
			movment = FloaterState.CHASE;
			sprite_index = sFloaterChase;
		}
	}
	if(current_time <= patrolDurr + patrolStart){
		if(oSoundManager.beat){
		c_vel_x = velo*patrolDirX;
		c_vel_y = velo*patrolDirY;
		}else{
			beat_t_s = (oSoundManager.beat_T)/1000;
			c_vel_x *=1 - (1/beat_t_s)*_dt;
			c_vel_y *=1 - (1/beat_t_s)*_dt;	
		}
	}else{
		patrolDirX*=-1;
		patrolDirY*=-1;
		patrolStart = current_time;
	}
}
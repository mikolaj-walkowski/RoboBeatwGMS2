// Script assets have changed for v2.3.0 see
// https://help.yoyogames.com/hc/en-us/articles/360005277377 for more information
function Floater_PATROL(){
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
		c_vel_x = patrolDirX * velo;
		c_vel_y = patrolDirY * velo;
	}else{
		patrolDirX*=-1;
		patrolDirY*=-1;
		patrolStart = current_time;
	}
}
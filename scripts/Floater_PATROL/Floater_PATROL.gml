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
	if(currMoveX > 0 || currMoveY>0){
		
	}else{
		currMoveX = MoveX;
		currMoveY = MoveY;
		patrolDirX*=-1;
		patrolDirY*=-1;
	}
		if(oSoundManager.beat){
			c_vel_x = currMoveX > 0 ? velo*patrolDirX : 0;
			c_vel_y = currMoveY > 0 ? velo*patrolDirY : 0;
			currMoveX --;
			currMoveY --;
		}else{
			beat_t_s = (oSoundManager.beat_T)/1000;
			c_vel_x *=1 - (1/beat_t_s)*_dt;
			c_vel_y *=1 - (1/beat_t_s)*_dt;	
	}
	
}
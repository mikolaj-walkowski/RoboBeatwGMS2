// Script assets have changed for v2.3.0 see
// https://help.yoyogames.com/hc/en-us/articles/360005277377 for more information
function Floater_CHASE(){
	target_x = oPlayer.x;
	target_y = oPlayer.y - 50;

	dir_x = target_x - x;
	dir_y = target_y - y;
	
	if(abs(dir_x) < 25 && abs(dir_y)<10){
		movment = FloaterState.CLAW_ATTACK;
		return;
	}

	len = sqrt(dir_x*dir_x + dir_y*dir_y);

	dir_x /= len;
	dir_y /= len;

	c_vel_x = velo*dir_x;
	c_vel_y = velo*dir_y;
}
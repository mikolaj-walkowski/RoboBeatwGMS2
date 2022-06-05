// Script assets have changed for v2.3.0 see
// https://help.yoyogames.com/hc/en-us/articles/360005277377 for more information
function bulldozerSTUN(){
	c_vel_x = 0;
	if(oSoundManager.beat){
		movment = bulldozerState.CHASE;	
	}
	show_debug_message("STUN")
}
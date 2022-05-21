/// @description Wstaw opis w tym miejscu
// W tym edytorze możesz zapisać swój kod

// Inherit the parent event
event_inherited();

current_state = f_gravity;
top_v_x = 200;

hp = 7;
outOfComission = false;
chargeRange = 100;
chargeBlindSpot = 0.4 * chargeRange;

enum bulldozerState
{
	ASLEEP,
	AWAKE,
	IDLE,
	RETREAT,
	ATTACK,
	CHASE,
	HIT,
	DEAD
}

movement = bulldozerState.ASLEEP;

takeDmg = function(damage)
{
	if(iframe_start+iframe_dur < current_time && movment!=bulldozerState.DEAD){
		iframe_start = current_time;
		hp-=damage;
		movment = bulldozerState.HIT;
	}
}

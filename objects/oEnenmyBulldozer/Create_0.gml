/// @description Wstaw opis w tym miejscu
// W tym edytorze możesz zapisać swój kod

// Inherit the parent event
event_inherited();

current_state = f_gravity;
top_v_x = 150;
charge_v = 300;

hp = 7;
outOfComission = false;
facingDirection = image_xscale; //left = 1, right = -1 Używaj image_xscale

chargeRange = 400;
chargeBlindSpot = 0.4 * chargeRange;
chargeDistanceCrossed = 0;
chargeStartX = 0;
chargeStartSet = false;

enum bulldozerState
{
	ASLEEP,
	AWAKE,
	IDLE,
	RETREAT,
	ATTACK,
	CHASE,
	CHARGE,
	HIT,
	DEAD,
	STUN
}

movment = bulldozerState.ASLEEP;

//Iframes
iframe_dur = 150;
iframe_start=0;

takeDmg = function(damage)
{
	if(iframe_start+iframe_dur < current_time && movment!=bulldozerState.DEAD){
		iframe_start = current_time;
		hp-=damage;
		movment = bulldozerState.HIT;
	}
}

/// @description Insert description here
// You can write your code in this editor

// Inherit the parent event
event_inherited();

current_state = flags;
velo = 50;
top_v_x = 50;

hp = 3;

enum FloaterState{
	CHASE,
	CLAW_ATTACK,
	PATROL,
	HIT,
	DEAD
}

movment = FloaterState.PATROL;
patrolRadius = 250;
patrolDurr = 2000;
patrolStart = 0;
patrolDirX = 1;
patrolDirY = 0;
dealtDMG=false;
/// @description Insert description here
// You can write your code in this editor

// Inherit the parent event
event_inherited();

current_state = flags;
velo = 50;


enum FloaterState{
	CHASE,
	CLAW_ATTACK
}

movment = FloaterState.CHASE;

dealtDMG=false;
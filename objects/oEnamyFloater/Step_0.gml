/// @description Insert description here
// You can write your code in this editor

// Inherit the parent event

switch(movment){
	case FloaterState.CHASE: Floater_CHASE(); break;
	case FloaterState.CLAW_ATTACK: Floater_CLAW_ATTACK(); break;
}

event_inherited();

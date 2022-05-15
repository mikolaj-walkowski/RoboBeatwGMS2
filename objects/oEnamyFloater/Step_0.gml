/// @description Insert description here
// You can write your code in this editor

// Inherit the parent event
var _dt = delta_time / 1000000;

switch(movment){
	case FloaterState.CHASE: Floater_CHASE(_dt); break;
	case FloaterState.CLAW_ATTACK: Floater_CLAW_ATTACK(); break;
	case FloaterState.PATROL: Floater_PATROL(_dt); break;
	case FloaterState.HIT: Floater_HIT() break;
	case FloaterState.DEAD: Floater_DEAD() break
}

event_inherited();

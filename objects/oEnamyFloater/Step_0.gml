/// @description Insert description here
// You can write your code in this editor

// Inherit the parent event
if(hp <= 0) movment = FloaterState.DEAD;

switch(movment){
	case FloaterState.CHASE: Floater_CHASE(); break;
	case FloaterState.CLAW_ATTACK: Floater_CLAW_ATTACK(); break;
	case FloaterState.PATROL: Floater_PATROL(); break;
	case FloaterState.HIT: Floater_HIT() break;
	case FloaterState.DEAD: Floater_DEAD() break
}

event_inherited();

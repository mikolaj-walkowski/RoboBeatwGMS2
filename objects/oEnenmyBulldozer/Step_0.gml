/// @description Wstaw opis w tym miejscu
// W tym edytorze możesz zapisać swój kod




switch(movment)
{
	case bulldozerState.ASLEEP: bulldozerASLEEP(); break;
	case bulldozerState.AWAKE: bulldozerAWAKE(); break;
	case bulldozerState.CHARGE: bulldozerCHARGE(); break;
	case bulldozerState.CHASE: bulldozerCHASE(); break;
	case bulldozerState.HIT: bulldozerHit(); break;
}

// Inherit the parent event
event_inherited();

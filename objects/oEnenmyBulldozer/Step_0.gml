/// @description Wstaw opis w tym miejscu
// W tym edytorze możesz zapisać swój kod

switch(movment)
{
	case bulldozerState.ASLEEP: bulldozerASLEEP(); break;
	case bulldozerState.AWAKE: bulldozerAWAKE(); break;
	case bulldozerState.CHARGE: bulldozerCHARGE(); break; // Teraz zaczne chargeować na kolejny beat ja bym dodał mu jakiś cooldown jeszcze 
	case bulldozerState.CHASE: bulldozerCHASE(); break;
	case bulldozerState.HIT: bulldozerHit(); break; 
	case bulldozerState.STUN: bulldozerSTUN(); break;
}

// Inherit the parent event
event_inherited();

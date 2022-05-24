// W wersji v2.3.0 zmieniono zasoby skryptu. Więcej informacji można znaleźć pod adresem
// https://help.yoyogames.com/hc/en-us/articles/360005277377
function bulldozerCHARGE(){
	c_vel_x = charge_v * (-facingDirection);
	if(!chargeStartSet)
	{
		chargeStartX = x;
		chargeStartSet = true;
	}
	if(abs(x - chargeStartX) >= chargeRange)
	{
		c_vel_x = 0;
		chargeStartSet = false;
		movement = bulldozerState.CHASE;
	}
	debug_event("CHARGE");
}
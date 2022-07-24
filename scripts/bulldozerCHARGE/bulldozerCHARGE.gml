// W wersji v2.3.0 zmieniono zasoby skryptu. Więcej informacji można znaleźć pod adresem
// https://help.yoyogames.com/hc/en-us/articles/360005277377
function bulldozerCHARGE(){
	
	if(!chargeStartSet)
	{
		chargeStartX = x;
		chargeStartSet = true;
	}
	if(abs(x - chargeStartX) >= chargeRange * 1.2 || c_vel_x == 0)
	{
		c_vel_x = 0;
		chargeStartSet = false;
		movment = bulldozerState.STUN;
	}
	c_vel_x = charge_v * -image_xscale;// Tutaj to moja wina trochę wszystkie nasze astey są obrócone w lewo a tbh powinny być w prawo dlatego jest tu ten minus
}
// W wersji v2.3.0 zmieniono zasoby skryptu. Więcej informacji można znaleźć pod adresem
// https://help.yoyogames.com/hc/en-us/articles/360005277377
function bulldozerCHASE(){
	if(instance_exists(global.player))
	{
		var dx = x - global.player.x; // Śmieszna metoda trochę bo zwraca ci liczbę mniejszą od zera w prawo a większą w lewo gdzie globalnie x rośnie w prawo 
		var dy = y - global.player.y;
		var distance = sqrt((dx * dx) + (dy * dy));
		c_vel_x = top_v_x * - sign(dx);
		if(sign(dx) * image_xscale > 0 && distance <= chargeRange && oSoundManager.beat){
			movment = bulldozerState.CHARGE;
			return;
			
		}
	}
	show_debug_message("CHASE");
}
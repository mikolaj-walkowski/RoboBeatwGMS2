// W wersji v2.3.0 zmieniono zasoby skryptu. Więcej informacji można znaleźć pod adresem
// https://help.yoyogames.com/hc/en-us/articles/360005277377
function bulldozerASLEEP(){
	if(instance_exists(global.player) && !outOfComission)
	{
		var dx = x - global.player.x;
		var dy = y - global.player.y;
		if(sign(dx) * image_xscale > 0 && abs(dx) <= chargeRange && abs(dy) < 64){ //jeżeli chodzi o ustawianie kierunku to sign jest według mnie jedną z lepszych metod
			movment = bulldozerState.AWAKE;
			return;
		}
		if(sign(dx) * image_xscale < 0 && abs(dy) <= chargeBlindSpot && abs(dy) < 64)
		{
			movment = bulldozerState.AWAKE;
			return;
		}
	}
}
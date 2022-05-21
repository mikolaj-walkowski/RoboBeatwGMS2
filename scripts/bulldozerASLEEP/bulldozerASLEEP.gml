// W wersji v2.3.0 zmieniono zasoby skryptu. Więcej informacji można znaleźć pod adresem
// https://help.yoyogames.com/hc/en-us/articles/360005277377
function bulldozerASLEEP(){
	if(instance_exists(global.player))
	{
		var dx = x - global.player.x;
		var dy = y - global.player.y;
		var distance = sqrt((dx * dx) + (dy * dy));
		if(dx < 0 && distance <= chargeRange)
			movement = bulldozerState.AWAKE;
		if(dx >= 0 && distance <= 20)
			movement = bulldozerState.AWAKE;
	}
}
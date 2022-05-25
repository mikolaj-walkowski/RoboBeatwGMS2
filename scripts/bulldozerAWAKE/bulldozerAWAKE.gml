// W wersji v2.3.0 zmieniono zasoby skryptu. Więcej informacji można znaleźć pod adresem
// https://help.yoyogames.com/hc/en-us/articles/360005277377
function bulldozerAWAKE(){
	if(instance_exists(global.player))
	{
		var dx = x - global.player.x;
		var dy = y - global.player.y;
		if(dx < 0 * facingDirection)
			movement = bulldozerState.CHARGE;
		else
			movement = bulldozerState.CHASE;
	}
	debug_event("AWAKE");
}
// W wersji v2.3.0 zmieniono zasoby skryptu. Więcej informacji można znaleźć pod adresem
// https://help.yoyogames.com/hc/en-us/articles/360005277377
function bulldozerCHASE(){
	if(instance_exists(global.player))
	{
		var dx = x - global.player.x;
		var dy = y - global.player.y;
		if(!dx < 0 * facingDirection)
			facingDirection *= -1;
		c_vel_x = top_v_x * (-facingDirection);
	}
	debug_event("CHASE");
}
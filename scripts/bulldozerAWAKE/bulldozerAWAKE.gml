// W wersji v2.3.0 zmieniono zasoby skryptu. Więcej informacji można znaleźć pod adresem
// https://help.yoyogames.com/hc/en-us/articles/360005277377
function bulldozerAWAKE(){
	if(instance_exists(global.player))
	{
		var dx = x - global.player.x;
		var dy = y - global.player.y;
		if(sign(dx) * image_xscale > 0 && oSoundManager.beat)
			movment = bulldozerState.CHARGE;
		else
			movment = bulldozerState.CHASE;
	}
	show_debug_message("AWAKE");
}
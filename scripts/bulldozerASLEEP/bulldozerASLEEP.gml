// W wersji v2.3.0 zmieniono zasoby skryptu. Więcej informacji można znaleźć pod adresem
// https://help.yoyogames.com/hc/en-us/articles/360005277377
function bulldozerASLEEP(){
	if(instance_exists(global.player) && !outOfComission)
	{
		var dx = x - global.player.x;
		var dy = y - global.player.y;
		var distance = sqrt((dx * dx) + (dy * dy)); // Teraz budzisz go w okręgu co moze być problemem (buldozer jest na platformie na d nami )
		if(sign(dx) * image_xscale > 0 && distance <= chargeRange){ //jeżeli chodzi o ustawianie kierunku to sign jest według mnie jedną z lepszych metod
			movment = bulldozerState.AWAKE;
			return;
			
		}
	}
	show_debug_message("ASLEEP");
}
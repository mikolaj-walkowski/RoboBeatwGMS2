// W wersji v2.3.0 zmieniono zasoby skryptu. Więcej informacji można znaleźć pod adresem
// https://help.yoyogames.com/hc/en-us/articles/360005277377
function bulldozerHit(){
	if(hp <= 0)
	{
		movment = bulldozerState.DEAD;
		return;
	}
	movment = bulldozerState.CHASE;
}
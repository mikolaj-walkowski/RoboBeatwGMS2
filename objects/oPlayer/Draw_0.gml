/// @description Insert description here
// You can write your code in this editor
#macro dashOffset 20

switch(movment){
	case PlayerState.DASH:
		var dirX = xprevious - x;
		var dirY = yprevious - y;
		
		var help = 1/sqrt(dirX*dirX+dirY*dirY);
		dirX*=help;
		dirY*=help;
		
		var step = dashOffset/5;
		var color = playerOnBeat? c_maroon : c_grey; 
		for(var i = 0 ; i < 5 ; ++i )
		{
			draw_sprite_ext(sPlayerDash2OV, image_index, dirX*step*i+x,dirY*step*i+y,image_xscale,1,0,color,(5-i)/5);
		}
		
	break;
	case PlayerState.ATTACK:
		var color = playerOnBeat? c_maroon : c_white; 
		draw_sprite_ext(sPlayerAttackOV, image_index,x,y,image_xscale,1,0,color,1);
	break;
}
draw_self()

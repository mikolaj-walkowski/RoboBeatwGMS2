/// @description Insert description here
// You can write your code in this editor
x=0;
y=0;

//if (playerOnBeat != -1){
//	if(playerOnBeat +300 >= current_time){
//		draw_sprite_ext(sStaticDeb,0,
//		x+cube_width*0.125 + cube_width*0.625*5,
//		y+cube_height*0.125 + cube_height*0.625,
//		0.5, 0.5,0, c_yellow ,1)
//	}
//}
//if (oSoundManager.beat_window){
//	draw_sprite_ext(sStaticDeb,0,
//	x+cube_width*0.125 + cube_width*0.625*5,
//	y+cube_height*0.125,
//	0.5, 0.5,0, c_orange ,1);
//}

//Tank & HP
draw_sprite(sHUDTankBg,0,hpX,hpY);
var HpH = sprite_get_height(sHUDTankHp);
var HpW = 207*(global.player.hp/global.player.hpMAX);
draw_sprite_part(sHUDTankHp,0,48,0,HpW,HpH,hpX+48,hpY)
draw_sprite(sHUDTank,0,hpX,hpY);

//Turbo

draw_sprite(sHUDTurboBg,0,tX,tY);
if(oSoundManager.beat_window){
	 beatColor = make_colour_hsv(24,255,255);
}else{
	beatColor = make_colour_hsv(24,255,color_get_value(beatColor) - 0.00155*delta_time);
}
draw_sprite_ext(sHUDTurboBeat,0,tX,tY,1,1,0,beatColor,1);
switch(global.player.ComboLv){
	case 3:
	draw_sprite(sHUDTurboCLv3,0,tX,tY);
	case 2:
	draw_sprite(sHUDTurboCLv2,0,tX,tY);
	case 1:
	draw_sprite(sHUDTurboCLv1,0,tX,tY);
	case 0:
	break;
}
draw_sprite(sHUDTurbo,0,tX,tY);

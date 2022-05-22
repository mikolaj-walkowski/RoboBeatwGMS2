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
draw_sprite(sHUDTankBg,0,x,y);
var HpH = sprite_get_height(sHUDTankHp);
var HpW = 207*(global.player.hp/global.player.hpMAX);
draw_sprite_part(sHUDTankHp,0,48,0,HpW,HpH,x+48,y)
draw_sprite(sHUDTank,0,x,y);

//Turbo
draw_sprite(sHUDTurboBg,0,x,scH);
if(oSoundManager.beat_window){
	 beatColor = make_colour_hsv(24,255,255);
}else{
	beatColor = make_colour_hsv(24,255,color_get_value(beatColor) - 0.00155*delta_time);
}
draw_sprite_ext(sHUDTurboBeat,0,x,scH,1,1,0,beatColor,1);
switch(global.player.ComboLv){
	case 3:
	draw_sprite(sHUDTurboCLv3,0,x,scH);
	case 2:
	draw_sprite(sHUDTurboCLv2,0,x,scH);
	case 1:
	draw_sprite(sHUDTurboCLv1,0,x,scH);
	case 0:
	break;
}
draw_sprite(sHUDTurbo,0,x,scH);

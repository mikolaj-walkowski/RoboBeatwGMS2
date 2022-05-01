/// @description Insert description here
// You can write your code in this editor
x=0;
y=0;
//draw_self();
for(var i=0 ; i < global.player.hp ; i++){
	draw_sprite_ext(sHealthBar,0,
	x+cube_width*0.125 + cube_width*0.625 *(i%5),
	y+cube_height*0.125 + cube_height*0.625* floor(i/5),
	0.5, 0.5,0, c_white ,1);
}
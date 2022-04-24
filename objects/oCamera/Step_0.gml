/// @description Insert description here
// You can write your code in this editor
var viewmat = matrix_build_lookat(global.player.x,global.player.y,-100,global.player.x,global.player.y,0,0,1,0);

camera_set_view_mat(camera, viewmat);

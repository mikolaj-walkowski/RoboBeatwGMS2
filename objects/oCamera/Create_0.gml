/// @description Insert description here
// You can write your code in this editor
camera = camera_create();

projWidth = 1280;
projHeight = 720;

var viewmat = matrix_build_lookat(global.player.x,global.player.y,-100,global.player.x,global.player.y,0,0,1,0);
var projmat = matrix_build_projection_ortho(projWidth,projHeight,1.0,500.0);



centerX = global.player.x;
centerY = global.player.y;

camera_set_view_mat(camera, viewmat);
camera_set_proj_mat(camera, projmat);

view_camera[0]=camera;
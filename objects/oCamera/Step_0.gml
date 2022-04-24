/// @description Insert description here
// You can write your code in this editor

if(global.player.x - centerX > projWidth/8 || global.player.x - centerX < - projWidth/8){
	if(global.player.x - centerX > projWidth/8){
		centerX = global.player.x  - projWidth/8;
	}else{
		centerX = global.player.x + projWidth/8;
	}
}

if(global.player.y - centerY > projHeight/8 || global.player.y - centerY < - projHeight/8){
	if(global.player.y - centerY > projHeight/8){
		centerY = global.player.y - projHeight/8;
	}else{
		centerY = global.player.y + projHeight/8;
	}
}

if(global.player.x + projWidth/2 > room_width || global.player.x - projWidth/2 < 0){
	if(global.player.x + projWidth/2 > room_width){
		centerX = room_width - projWidth/2;
	}else{
		centerX = projWidth/2;
	}
}

if(global.player.y + projHeight/2 > room_height || global.player.y - projHeight/2 < 0){
	if(global.player.y + projHeight/2 > room_height){
		centerY = room_height - projHeight/2;
	}else{
		centerY = projHeight/2;
	}
}

var viewmat = matrix_build_lookat(centerX,centerY,-100,centerX,centerY,0,0,1,0);

camera_set_view_mat(camera, viewmat);

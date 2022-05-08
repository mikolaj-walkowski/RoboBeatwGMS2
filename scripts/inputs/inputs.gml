// Script assets have changed for v2.3.0 see
// https://help.yoyogames.com/hc/en-us/articles/360005277377 for more information
function inputs(){
	left = keyboard_check(ord("A"))
	right = keyboard_check(ord("D"))
	up = keyboard_check(ord("W"))
	down = keyboard_check(ord("S"))

	dash_btn = gamepad_button_check_pressed(0,gp_face2) + keyboard_check_pressed(vk_shift);
	jump_btn = gamepad_button_check_pressed(0,gp_face1) + keyboard_check_pressed(vk_space);
	jump_realese  = gamepad_button_check_released(0,gp_face1) + keyboard_check_released(vk_space);
	attack_btn = keyboard_check(ord("J")) + gamepad_button_check_pressed(0,gp_face3);

	//Ustalanie kierunku w pionie dla dasza
	var h1 = gamepad_axis_value(0, gp_axislh);
	h1 = h1 > 0.15 || h1 <-0.15 ? h1 : 0;
	hdir = h1;
	hdir += right - left;

	var h2 = gamepad_axis_value(0, gp_axislv);
	h2 = h2 > 0.15 || h2 < -0.15 ? h2 : 0;
	vdir = h2;
	vdir += down - up;
}
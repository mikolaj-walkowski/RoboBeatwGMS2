/// @description Insert description here
// You can write your code in this editor
var _dt = delta_time / 1000000;

left = keyboard_check(ord("A"))
right = keyboard_check(ord("D"))
jump = keyboard_check(ord("W"))

var hdir = right - left;
y = yprevious + grav*_dt;
x = xprevious + hdir*velo*_dt;
/*
if(place_meeting(hmove + x ,y, oStatic)){
	while(!place_meeting(1+x,y,o oStatic))
}*/

//phy_linear_velocity_y = - grav*delta_time
/*
if(place_meeting(hmove + x ,y, oStatic)){
	while(!place_meeting(1+x,y,o oStatic))
}*/

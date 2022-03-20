/// @description Insert description here
// You can write your code in this editor

var _dt = delta_time / 1000000;

left = keyboard_check(ord("A"))
right = keyboard_check(ord("D"))
up = keyboard_check(ord("W"))
down = keyboard_check(ord("S"))

hdir = 0;
h1 = gamepad_axis_value(0, gp_axislh);
h1 = h1 > 0.15 || h1 <-0.15 ? h1 : 0;
hdir += h1;
hdir += right - left;

vdir = 0;
vdir += gamepad_button_check(0,gp_face2)- gamepad_button_check(0,gp_face1)
vdir += down - up;

if(touching_b == 1){
	c_vel_y = vdir * velo_v;
}

c_vel_y += grav*_dt;
c_vel_x = hdir*velo*_dt;

image_xscale = sign(c_vel_x) != 0 ? sign(c_vel_x) : 1;

var dx = c_vel_x;
var dy = c_vel_y;

x = xprevious + dx;
y = yprevious + dy;

if( !place_empty(xprevious,y,Static)){
	for(var i = 10; !place_empty(xprevious,y,Static) ; i-=1){
		var in_dy = dy/10 ;
		y = yprevious + in_dy*i;
	}
	if(c_vel_y > 0){
			touching_b = 1;
	}
	c_vel_y=0;
}else{
	touching_b = 0;	
}

if( !place_empty(x,yprevious,Static)){
	for(var i = 10; !place_empty(x,yprevious,Static) ; i-=1){
		var in_dx = dx/10;
		x = xprevious + in_dx*i;
	}
	c_vel_x =0;
}

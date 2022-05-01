/// @description Insert description here
// You can write your code in this editor
#macro flags 0
#macro f_gravity 1
#macro f_friction 2
#macro f_as 4
#macro f_xaccel 8

//Movment / Physics
current_state = 0;
g = 300;
fric_cof = 0.9;

mass = 10;

c_vel_x = 0;
c_vel_y= 0;

i_vel_x = 0;

top_v_x = 300;

a_x = 800;

touching_b =0;
safeDist = 2;

// Attacks and Damage
hp = 10 
/// @description Insert description here
// You can write your code in this editor
#macro EPSILON 1

#macro flags 0
#macro f_gravity 1 
#macro f_friction 1 << 1
#macro f_noautoflip 1 << 2 
#macro f_xaccel 1 << 3
#macro f_yaccel 1 << 4

//show_debug_message(f_gravity);
//show_debug_message(f_friction);
//show_debug_message(f_noautoflip);
//show_debug_message(f_xaccel);

//Movment / Physics
current_state = 0;
g = 300;
fric_cof = 0.9;

mass = 10;

c_vel_x = 0;
c_vel_y= 0;

i_vel_x = 0;
i_vel_y =0;

top_v_x = 300;
top_v_y = 600;

a_x = 800;
a_y = 800; 
touching_b =0;
safeDist = 2;

// Attacks and Damage
hp = 10 

collision = false;

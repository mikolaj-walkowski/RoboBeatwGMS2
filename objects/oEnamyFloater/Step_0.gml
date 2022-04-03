/// @description Insert description here
// You can write your code in this editor

// Inherit the parent event

target_x = OPlayerR.x;
target_y = OPlayerR.y;

dir_x = target_x - x;
dir_y = target_y - y;

len = sqrt(dir_x*dir_x + dir_y*dir_y);

dir_x /= len;
dir_y /= len;

c_vel_x = velo*dir_x;
c_vel_y = velo*dir_y;

event_inherited();

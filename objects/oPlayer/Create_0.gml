/// @description Insert description here
// You can write your code in this editor

event_inherited();

enum PlayerState{
	NORMAL,
	DASH
}	

movment = PlayerState.NORMAL; 

velo_v = 300;
velo_h = 200;

dash_velo = 1000;
dash_cnt = 2;
dash_dir_x = 0;
dash_dir_y = 0;
dash_start = 0;
dash_dur = 150;

current_state = (f_gravity|f_as)

/// @description Insert description here
// You can write your code in this editor

event_inherited();

global.player = object_index;

enum PlayerState{
	NORMAL,
	DASH,
	DEAD
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

//Particle Mby

//global.P_system = part_system_create_layer("Test1",false);
//global.pPlayerDash = part_type_create();

//part_type_sprite(global.pPlayerDash,pCharacterDash,false,false,false);
//part_type_size(global.pPlayerDash,20,20,0.2,20.5);
//part_type_life(global.pPlayerDash, 15, 60);

//dashEmmiter = part_emitter_create(global.P_system);

//Overlay
surf = -1; 
lastHitT=0;
ovDur = 100;
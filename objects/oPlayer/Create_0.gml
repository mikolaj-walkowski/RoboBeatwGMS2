/// @description Insert description here
// You can write your code in this editor

event_inherited();

global.player = object_index;

enum PlayerState{
	NORMAL,
	DASH,
	DEAD,
	HIT,
	ATTACK //TODO Lock Attack direction
}	
//State machine
movment = PlayerState.NORMAL; 

//Draw stuff
playerOnBeat = false;

//Health
hpMAX = 10;
hp=hpMAX;

//Inputs
dash_btn =0;
jump_btn = 0;
attack_btn =0;
hdir = 0; 
vdir = 0;

//jump stuff
jump_btn_hold = false;
jump_height = 75;
jump_startY = 0;
//jump_hold = 1.5*g;
//jump_normal = 2.5*g;
//jump_fall = 3.5*g;

g *= 3.5;

//dash stuf
dash_velo = 750;
dash_cnt_max = 2;
dash_cnt = dash_cnt_max;
dash_dir_x = 0;
dash_dir_y = 0;
dash_start = 0;
dash_dur =  150;
dash_curr_dur= dash_dur;


//Physics stuff 
velo_v = 300;
velo_h = 250;
current_state = (f_gravity|f_xaccel);
top_v_x = 300;

//Attack stuff
currentHit = ds_list_create();
attack_speed = 200;
currentDmg = 1;

//Iframe
iframe_dur = 15;
iframe_start=0;
sprite_set_speed(sPlayerHit,sprite_get_number(sPlayerHit)/(iframe_dur/1000),spritespeed_framespersecond)

//Combo Meter

ComboLv = 0;

//object functions
takeDmg= function(damage){
		if(iframe_start+iframe_dur < current_time && movment!= PlayerState.DEAD){
			iframe_start = current_time;
			hp-=damage;
			movment = PlayerState.HIT;
		}
}

//Particle Mby

//global.P_system = part_system_create_layer("Test1",false);
//global.pPlayerDash = part_type_create();

//part_type_sprite(global.pPlayerDash,pCharacterDash,false,false,false);
//part_type_size(global.pPlayerDash,20,20,0.2,20.5);
//part_type_life(global.pPlayerDash, 15, 60);

//dashEmmiter = part_emitter_create(global.P_system);

////Overlay
//surf = -1; 
//lastHitT=0;
//ovDur = 100;


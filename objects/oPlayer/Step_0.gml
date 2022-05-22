/// @description Insert description here
// You can write your code in this editor

// czas w sekundach

var _dt = delta_time / 1000000;

if(hp <= 0) movment = PlayerState.DEAD;

dash_cnt = touching_b == 1 ? dash_cnt_max : dash_cnt;


switch(movment){
	case PlayerState.NORMAL: Player_NORMAL(_dt) break;
	case PlayerState.DASH: Player_DASH(); break;
	case PlayerState.HIT: Player_HIT(); break;
	case PlayerState.DEAD: {c_vel_x=0; playerOnBeat=false;} break;
	case PlayerState.ATTACK: Player_ATTACK(_dt) break;
}


event_inherited();




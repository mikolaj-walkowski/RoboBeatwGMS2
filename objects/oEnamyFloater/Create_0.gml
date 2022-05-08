/// @description Insert description here
// You can write your code in this editor

// Inherit the parent event
event_inherited();

//Physics
current_state = flags;
velo = 50;
top_v_x = 50;


hp = 3;

enum FloaterState{
	CHASE,
	CLAW_ATTACK,
	PATROL,
	HIT,
	DEAD
}
//Debug
//sprite_set_speed(sFloaterClaw,sprite_get_number(sFloaterClaw)/5,spritespeed_framespergameframe);

movment = FloaterState.PATROL;

//Patrols
patrolRadius = 250;
patrolDurr = 2000;
patrolStart = 0;
patrolDirX = 1;
patrolDirY = 0;

//Attack
dealtDMG=false;

//Iframes
iframe_dur = 15;
iframe_start=0;
sprite_set_speed(sFloaterHit,sprite_get_number(sFloaterHit)/iframe_dur,spritespeed_framespergameframe)

takeDmg= function(damage){
		if(iframe_start+iframe_dur < current_time && movment!=FloaterState.DEAD){
			iframe_start = current_time;
			hp-=damage;
			movment = FloaterState.HIT;
		}
}
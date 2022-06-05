/// @description Insert description here
// You can write your code in this editor
x=0;
y=0;

//Tank & HP
draw_sprite(sHUDTankBg,0,hpX,hpY);
var HpH = sprite_get_height(sHUDTankHp);
var HpW = 207*(global.player.hp/global.player.hpMAX);
draw_sprite_part(sHUDTankHp,0,48,0,HpW,HpH,hpX+48,hpY)
draw_sprite(sHUDTank,0,hpX,hpY);

//Turbo

draw_sprite(sHUDTurboBg,0,tX,tY);

if(tCycle == 0){ 
	var h = lerp(25,8,(current_time - tCycleStart)/(oSoundManager.beat_T - oSoundManager.windowBf -oSoundManager.windowAf));
	var s = lerp(164,224,(current_time - tCycleStart)/(oSoundManager.beat_T - oSoundManager.windowBf -oSoundManager.windowAf));
	beatColor = make_color_hsv(h,s,255);
	if(oSoundManager.beat_window){  //low 10,80,100
		tCycle = 1;
		tCycleStart = current_time;
	}
}
if(tCycle == 1){ 
	var h = lerp(8,50,(current_time - tCycleStart)/(oSoundManager.windowBf));
	var s = lerp(224,124,(current_time - tCycleStart)/(oSoundManager.windowBf));
	beatColor = make_color_hsv(h,s, 255);
	if(oSoundManager.beat){ //peak 55,40,100
		tCycle = 2;
		tCycleStart = current_time;
	}
}
if(tCycle == 2){ 
	var h = lerp(50,25,(current_time - tCycleStart)/(oSoundManager.windowAf));
	var s = lerp(124,164,(current_time - tCycleStart)/(oSoundManager.windowAf));
	beatColor = make_color_hsv(h,s, 255);
	if(!oSoundManager.beat_window){ //peak 55,40,100
		tCycle = 0;
		tCycleStart = current_time;
	}
}

draw_sprite_ext(sHUDTurboBeat,0,tX,tY,1,1,0,beatColor,1);

switch(global.player.ComboLv){
	case 3:
	draw_sprite(sHUDTurboCLv3,0,tX,tY);
	case 2:
	draw_sprite(sHUDTurboCLv2,0,tX,tY);
	case 1:
	draw_sprite(sHUDTurboCLv1,0,tX,tY);
	case 0:
	break;
}
draw_sprite(sHUDTurbo,0,tX,tY);

//Gauage 

draw_sprite_ext(sHUDFuelGauage,0,gX,gY, 1, 1, gA, c_white, 1);


var ang = lerp(gaAmax,gaAmin, (current_time -gaStart)/gaAt);
ang = ang > gaAmin ? gaAmin: ang; 
draw_sprite_ext(sHUDFuelGauageArm,0,gaX,gaY, 1, 1,
	ang,
	c_white, 1);

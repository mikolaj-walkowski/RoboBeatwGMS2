/// @description Insert description here
// You can write your code in this editor


//Tank stuff
hpX = -40;
hpY = -5;

//Turbo stuff
scH=oCamera.projHeight;
beatColor = c_black;
tX = -30;
tY=scH +60;

//Fuel Gauage
scW = oCamera.projWidth;
gX = scW + sprite_get_width(sHUDFuelGauage)/2 - 5;
gY = scH - sprite_get_height(sHUDFuelGauage)/4;

gA = 45;

gaX = scW - 15;
gaY = scH - 22;
gaAmax = gA- 43; 

gaAmin = gA + 43;

gaStart = current_time;
gaAt = 10000;

playerOnBeat = -1;

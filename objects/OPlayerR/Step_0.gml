/// @description Insert description here
// You can write your code in this editor

// czas w sekundach
var _dt = delta_time / 1000000;


//przechwytywanie klawiatury
left = keyboard_check(ord("A"))
right = keyboard_check(ord("D"))
up = keyboard_check(ord("W"))
down = keyboard_check(ord("S"))

dash_btn = gamepad_button_check_pressed(0,gp_face2) + keyboard_check_pressed(vk_space);

//Ustalanie kierunku w pionie dla dasza
hdir = 0;
h1 = gamepad_axis_value(0, gp_axislh);
h1 = h1 > 0.15 || h1 <-0.15 ? h1 : 0;
hdir += h1;
hdir += right - left;


vdir = 0;
vdir += gamepad_button_check(0,gp_face2)- gamepad_button_check(0,gp_face1)
vdir += down - up;

//Ustalanie kierunku w poziomie dla dasza
h2 = gamepad_axis_value(0, gp_axislv);
vdirv2 = h2 > 0.15 || h2 < -0.15 ? h2 : 0;
vdirv2 += down - up;


//Jeżeli obiekt dotyka podloża
//1. Pozwalamy na ustawinie prędkości w pionie
//2. Usuwamy prędkość co klatkę, narazie to dodałem bo chce żeby postać w locie była trudniejsza do kontrolowania
if(touching_b == 1){
	c_vel_y = vdir * velo_v;
	c_vel_x=0;
}

h_sum = abs(vdirv2) + abs(hdir)


//Logika dla dasza
if(dash_btn == 1 && dash_cnt > 0 && h_sum != 0){
	
	//Zapamiętuje prędkość startową
	dash_start_xvel = c_vel_x;
	dash_start_yvel = c_vel_y;
	
	//Nadaje prędkość na czas dasz-a 
	c_vel_y = vdirv2/h_sum * dash_velo;
	c_vel_x = hdir/h_sum * dash_velo;
	
	show_debug_message(string(dash_start_xvel)+" "+string(dash_start_yvel))
	//Pomniejszam ilość dostępnych daszy
	dash_cnt-=1;
	dash_start = current_time; 
	state = dashing;
}

switch(state){
	case moving:
	{
		//Grawitacja 
		c_vel_y += grav;// *_dt; Wiem że to nie fizyczne no ale
		//Zminejszam prędkoś z jaką obiekt może sie poruszać w powietrzu
		c_vel_x += touching_b == 1 ? hdir*velo : hdir*velo/70;
	break;	
	}
	case dashing:
	{
		//Sprawdzam czy dalej powinienem być w daszu
		if(current_time >= dash_start + dash_dur){
			//Przywracam starą prędkość
				c_vel_y = dash_start_yvel;
				c_vel_x = dash_start_xvel;
				show_debug_message(string(dash_start_xvel)+" "+string(dash_start_yvel))
				show_debug_message(string(c_vel_x)+" "+string(c_vel_y))
				state = moving;
		}
	break;	
	}	
}

//Obracam sprit-a obiektu w zależności od kierunku w którym się porusza
image_xscale = sign(c_vel_x) != 0 ? sign(c_vel_x) : 1;

//Wartości o które, zmieniamy pozycje
var dx = c_vel_x*_dt;
var dy = c_vel_y*_dt;

//Końcowe pozycje
x = xprevious + dx;
y = yprevious + dy;

//Sprawdzam czy w danej osi będzie zachodzić kolizja jeżeli nastąpi ruch o całe dY 
if(!place_empty(xprevious,y,Static)){
	//Jeżeli zachodzi to sprawdzam dla pozycji o 0.1 mniejszej, ogólnie kiedyś to warto przyśpieszyć binsearch-em.
	for(var i = 10; !place_empty(xprevious,y,Static) ; i-=1){
		var in_dy = dy/10 ;
		y = yprevious + in_dy*i;
	}
	//Jeżeli zaszła kolizja i obietk przed nią nie poruszał się do góry 
	if(c_vel_y > 0){
			touching_b = 1;
			dash_cnt=1;
	}
	//Zawsze po kolizj zależnej od dY zeruje prędkość y
	c_vel_y=0;
}else{
	touching_b = 0;	
}

//Sprawdzam czy w danej osi będzie zachodzić kolizja jeżeli nastąpi ruch o całe dX
if( !place_empty(x,yprevious,Static)){
	//Jeżeli zachodzi to sprawdzam dla pozycji o 0.1 mniejszej, ogólnie kiedyś to warto przyśpieszyć binsearch-em.
	for(var i = 10; !place_empty(x,yprevious,Static) ; i-=1){
		var in_dx = dx/10;
		x = xprevious + in_dx*i;
	}
	//Zawsze po kolizj zależnej od dX zeruje prędkość x
	c_vel_x =0;
}

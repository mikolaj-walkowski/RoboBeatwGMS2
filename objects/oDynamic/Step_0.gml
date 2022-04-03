var _dt = delta_time / 1000000;

if(current_state&f_gravity!=0){ 
	c_vel_y += g*_dt;
}
if(current_state&f_friction!=0){
	c_vel_x *= fric_cof*_dt;
}

//Wartości o które, zmieniamy pozycje
var dx = c_vel_x*_dt;
var dy = c_vel_y*_dt;

//Końcowe pozycje
x = xprevious + dx;
y = yprevious + dy;

//Obracam sprit-a obiektu w zależności od kierunku w którym się porusza
image_xscale = sign(c_vel_x) != 0 ? sign(c_vel_x) : 1;


//Jeżeli obiekt dotyka podloża
//1. Pozwalamy na ustawinie prędkości w pionie
//2. Usuwamy prędkość co klatkę, narazie to dodałem bo chce żeby postać w locie była trudniejsza do kontrolowania

if( !place_empty(x,yprevious,oDynamic)){
	//Jeżeli zachodzi to sprawdzam dla pozycji o 0.1 mniejszej, ogólnie kiedyś to warto przyśpieszyć binsearch-em.
	for(var i = 10; !place_empty(x,yprevious,oDynamic) ; i-=1){
		var in_dx = dx/10;
		x = xprevious + in_dx*i;
	}
	//Zawsze po kolizj zależnej od dX zeruje prędkość x
	c_vel_x =0;
}

if(!place_empty(xprevious,y,oDynamic)){
	//Jeżeli zachodzi to sprawdzam dla pozycji o 0.1 mniejszej, ogólnie kiedyś to warto przyśpieszyć binsearch-em.
	for(var i = 10; !place_empty(xprevious,y,oDynamic) ; i-=1){
		var in_dy = dy/10 ;
		y = yprevious + in_dy*i;
	}
	//Jeżeli zaszła kolizja i obiekt przed nią nie poruszał się do góry 
	if(c_vel_y > 0){
			touching_b = 1;
	}
	//Zawsze po kolizj zależnej od dY zeruje prędkość y
	c_vel_y=0;
}else{
	touching_b = 0;	
}



var _dt = delta_time / 1000000;

touching_b =0;

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

//Dynamic Collisons - Just bounce off
//It will brake for movment faster than (s/2)/dT  

collidedWith = ds_list_create();

var size = instance_place_list(x,y, oDynamic,collidedWith,false);
for(var i = 0; i < size ; i++){
	var oth = collidedWith[|i];
	
	if(place_meeting(x,yprevious,oth)){
	//Jeżeli zachodzi to sprawdzam dla pozycji o 0.1 mniejszej, ogólnie kiedyś to warto przyśpieszyć binsearch-em.
	for(var i = 10; place_meeting(x,yprevious,oth) ; i-=1){
		var in_dx = dx/10;
		x = xprevious + in_dx*i;
	}
	//Zawsze po kolizj zależnej od dX zeruje prędkość x
	}
	if(place_meeting(xprevious,y,oth)){
	//Jeżeli zachodzi to sprawdzam dla pozycji o 0.1 mniejszej, ogólnie kiedyś to warto przyśpieszyć binsearch-em.
		for(var i = 10; place_meeting(xprevious,y,oth) ; i-=1){
			var in_dy = dy/10 ;
			y = yprevious + in_dy*i;
		}
	}
	
	//From other to current
	
	var d_x = -sign(oth.x - x);
	var d_y = -sign(oth.y - y);
	
	var d_v1_x = oth.c_vel_x*-d_x > 0 ? oth.c_vel_x: 0;
	var d_v1_y = oth.c_vel_y*-d_y > 0 ? oth.c_vel_y: 0;

	var d_v2_x = c_vel_x*d_x > 0 ? c_vel_x: 0;
	var d_v2_y = c_vel_y*d_y > 0 ? c_vel_y: 0;
	
	oth.c_vel_x = d_v1_x;
	oth.c_vel_y = d_v1_y;

	c_vel_x = d_v2_x;
	c_vel_y = d_v2_y;
	
	touching_b = c_vel_y == 0 ? 1:0;
	
	//x += d_x*safeDist;
	//y += d_y*safeDist;
	
	//oth.x -= d_x*safeDist;
	//oth.y -= d_y*safeDist;
}
ds_list_destroy(collidedWith);

//Jeżeli obiekt dotyka podloża
//1. Pozwalamy na ustawinie prędkości w pionie
//2. Usuwamy prędkość co klatkę, narazie to dodałem bo chce żeby postać w locie była trudniejsza do kontrolowania

if( !place_empty(x,yprevious,oStatic)){
	//Jeżeli zachodzi to sprawdzam dla pozycji o 0.1 mniejszej, ogólnie kiedyś to warto przyśpieszyć binsearch-em.
	for(var i = 10; !place_empty(x,yprevious,oStatic) ; i-=1){
		var in_dx = dx/10;
		x = xprevious + in_dx*i;
	}
	//Zawsze po kolizj zależnej od dX zeruje prędkość x
	c_vel_x =0;
}


if(!place_empty(xprevious,y,oStatic)){
	//Jeżeli zachodzi to sprawdzam dla pozycji o 0.1 mniejszej, ogólnie kiedyś to warto przyśpieszyć binsearch-em.
	for(var i = 10; !place_empty(xprevious,y,oStatic) ; i-=1){
		var in_dy = dy/10 ;
		y = yprevious + in_dy*i;
	}
	//Jeżeli zaszła kolizja i obiekt przed nią nie poruszał się do góry aa
	if(c_vel_y > 0){
			touching_b = 1;
	}
	//Zawsze po kolizj zależnej od dY zeruje prędkość y
	c_vel_y=0;
}


if(sign(c_vel_x) != 0){
	image_xscale = -sign(c_vel_x);
	if (! place_empty(x,y)){
		image_xscale *= -1;
	}
}


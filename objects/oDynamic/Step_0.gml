var _dt = delta_time / 1000000;
collision = false;

a_y = g;

if(current_state&f_gravity!=0){ 
	c_vel_y += g*_dt;
}

// Fragmen odpowiedzialny za acceleracje w osi ox
// W założeniu powinien pozwolić graczowi na większą kontole 
if(current_state&f_xaccel!=0){
	//W tym przypadku uznajemy c_vel_x jako kierunek ruchu i ignorujemy jego wartość
	c_vel_x = sign(c_vel_x);
	//Wyznaczam maksymalną prędkość ruchu w oX (zmiejszona o połowe w powietrzu żeby lekko utrudnić movment)
	var top = top_v_x//touching_b==1 ? top_v_x : top_v_x *0.5;
	//Przyśpieszenie oX (zmiejszone o połowe w powietrzu żeby lekko utrudnić movment)
	var a = touching_b==1 ? a_x : a_x *0.5;
	if(c_vel_x*i_vel_x >= 0) //Jeżeli kierunek w którym chce się poruszć jest zgodny z obecnym kierunkiem ruchu albo chce się zatrzymać
		i_vel_x = approach(i_vel_x,c_vel_x*top,a*_dt);
	else //Jeżeli chce zmienić kierunek ruchu 
		i_vel_x = approach(i_vel_x,c_vel_x*top,a*_dt*2);
}else{
	// Jeżeli flaga nie jest aktywna poprostu przypisuje zwykła wartość
	i_vel_x = c_vel_x;
}
if(current_state&f_yaccel!=0){
	//W tym przypadku uznajemy c_vel_y jako kierunek ruchu i ignorujemy jego wartość
	c_vel_y = sign(c_vel_y);
	if(c_vel_y*i_vel_y >= 0) //Jeżeli kierunek w którym chce się poruszć jest zgodny z obecnym kierunkiem ruchu albo chce się zatrzymać
		i_vel_y = approach(i_vel_y,c_vel_y*top_v_y,a_y*_dt);
	else //Jeżeli chce zmienić kierunek ruchu 
		i_vel_y = approach(i_vel_y,c_vel_y*top_v_y,a_y*_dt*2);
}else{
	// Jeżeli flaga nie jest aktywna poprostu przypisuje zwykła wartość
	i_vel_y = c_vel_y;
}


if(current_state&f_friction!=0){
	i_vel_x *= fric_cof*_dt;
}

//Wartości o które, zmieniamy pozycje
var dx = i_vel_x*_dt;
var dy = i_vel_y*_dt;
//Końcowe pozycje
x = xprevious + dx;
y = yprevious + dy;

//Dynamic Collisons - Just bounce off
//It will brake for movment faster than (s/2)/dT
touching_b = 0;

collidedWith = ds_list_create();

var size = instance_place_list(x,y, oDynamic,collidedWith,false);
for(var i = 0; i < size ; i++){
	collision = true;
	var oth = collidedWith[|i];
	
	// Narazie to wektor w kierunku kolidującego (nie unormowany, teoretycznie powinnien być unormowany)
	var d_x = -sign(oth.x - x);
	var d_y = -sign(oth.y - y);
	
	if(place_meeting(x,yprevious,oth)){
	//Jeżeli zachodzi to sprawdzam dla pozycji o 0.1 mniejszej, ogólnie kiedyś to warto przyśpieszyć binsearch-em.
	for(var i = 10; place_meeting(x,yprevious,oth) && i>0; i-=1){
		var in_dx = dx/10;
		x = xprevious + in_dx*i;
	}
	x += d_x*safeDist;
	}
	if(place_meeting(xprevious,y,oth)){
	//Jeżeli zachodzi to sprawdzam dla pozycji o 0.1 mniejszej, ogólnie kiedyś to warto przyśpieszyć binsearch-em.
		for(var i = 10; place_meeting(xprevious,y,oth) && i>0 ; i-=1){
			var in_dy = dy/10 ;
			y = yprevious + in_dy*i;
		}
		y += d_y*safeDist;
	}
	
	//Zeruje prędkości w zależności w kierunku zderzenia + w przysłości powinniśmy przerobić to tak żeby uwzględniało pędy
	var d_v1_x = oth.c_vel_x*-d_x > 0 && abs(oth.c_vel_x) > EPSILON? oth.c_vel_x: 0;
	var d_v1_y = oth.c_vel_y*-d_y > 0 && abs(oth.c_vel_y) > EPSILON ? oth.c_vel_y: 0;

	var d_v2_x = i_vel_x*d_x > 0 && abs(i_vel_x) > EPSILON ? i_vel_x: 0;
	var d_v2_y = i_vel_y*d_y > 0 && abs(i_vel_y) > EPSILON ? i_vel_y: 0;
	
	oth.i_vel_x = d_v1_x;
	oth.i_vel_y = d_v1_y;
	
	oth.c_vel_x = d_v1_x;
	oth.c_vel_y = d_v1_y;

	i_vel_x = d_v2_x;
	i_vel_y = d_v2_y;
	
	c_vel_x = d_v2_x;
	c_vel_y = d_v2_y;
	
	touching_b = i_vel_y == 0 ? 1:0;
	
	//oth.x -= d_x*safeDist;
	//oth.y -= d_y*safeDist;
}
ds_list_destroy(collidedWith);

//Jeżeli obiekt dotyka podloża
//1. Pozwalamy na ustawinie prędkości w pionie
//2. Usuwamy prędkość co klatkę, narazie to dodałem bo chce żeby postać w locie była trudniejsza do kontrolowania

if( !place_empty(x,yprevious,oStatic)){
	collision = true;
	//Jeżeli zachodzi to sprawdzam dla pozycji o 0.1 mniejszej, ogólnie kiedyś to warto przyśpieszyć binsearch-em.
	for(var i = 10; !place_empty(x,yprevious,oStatic) ; i-=1){
		var in_dx = dx/10;
		x = xprevious + in_dx*i;
	}
	//Zawsze po kolizj zależnej od dX zeruje prędkość x
	i_vel_x =0;
}


if(!place_empty(xprevious,y,oStatic)){
	collision = true;
	//Jeżeli zachodzi to sprawdzam dla pozycji o 0.1 mniejszej, ogólnie kiedyś to warto przyśpieszyć binsearch-em.
	for(var i = 10; !place_empty(xprevious,y,oStatic) ; i-=1){
		var in_dy = dy/10 ;
		y = yprevious + in_dy*i;
	}
	//Jeżeli zaszła kolizja i obiekt przed nią nie poruszał się do góry aa
	if(i_vel_y > 0){
			touching_b = 1;
	}
	//Zawsze po kolizj zależnej od dY zeruje prędkość y
	i_vel_y=0;
	c_vel_y=0;
}

//Obracam sprit-a obiektu w zależności od kierunku w którym się porusza
if(sign(c_vel_x) != 0 && (f_noautoflip&current_state)!=f_noautoflip){
	image_xscale = -sign(c_vel_x);
	if (! place_empty(x,y)){
		image_xscale *= -1;
	}
}


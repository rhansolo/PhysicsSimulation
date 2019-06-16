float a;
int moving = 0;
float mass1 = 75;
float mass2 = 75;
float massp = 5;
//coefficient of friction
float fric1 = 0;
float fricStatic1 = 0.2;
float fric2 = 0;
float fricStatic2 = 0.2;

float g = 9.81;
float v1, v2;
float ang1 = 60 * PI / 180;
float ang2 = 60 * PI / 180;
PVector velocity1;
PVector position1 = new PVector(tmpX1,tmpY1);
PVector velocity2;
PVector position2 = new PVector(tmpX2,tmpY2);

void calculate(){
   //print(t + " ");
  //print(mass1 + " " + ang1 + " " + fric1 + " " + mass2 + " " + ang2 + " " + fric2 + " ");
  //print(a + " ");
  //positive a means going to the left
  a = ((mass1*g*cos(ang1))+(mass1*fric1*g*sin(ang1))-(mass2*g*cos(ang2))+(mass2*fric2*g*sin(ang2)))/((0.5*massp)+mass1+mass2);
  //print(a + " ");
  v1 = abs(a*t);
  v2 = abs(a*t);
  if (a > 0){
  //moving left
   if (mass2*g*(cos(ang2)+fric2*sin(ang2)) >= mass1*g*(cos(ang1)-fric1*sin(ang1))){
     t = 0;
     a = 0;

     moving = 0;
   }
   else{
     moving = 1;
   }
  }
  else if (a < 0){
   // moving right
   if (mass2*g*(cos(ang2)-fric2*sin(ang2)) <= mass1*g*(cos(ang1)+fric1*sin(ang1))){
     t = 0;
     a = 0;

     moving = 0;
   }
   else{
     moving = -1;
   }
  }
  else{
    // not moving
   t = 0;
   a = 0;

   moving = 0;
  }

}

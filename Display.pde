void displayKey(){
  rectMode(CORNER);
  fill(255);
  rect(950,t(615),200,200);
  
  fill(0);
  textSize(16);
  text("Key:", 955, t(595));
  
  fill(255,0,0);
  square(960,t(570),15);
  fill(0);
  text("Force of Friction", 990,t(555));
  
  
  fill(255,165,0);
  square(960,t(535),15);
  fill(0);
  text("Normal Force", 990,t(520));
  
  
  fill(51,153,255);
  square(960,t(500),15); 
  fill(0);
  text("Tension Force", 990,t(485));
  
  fill(0,128,0);
  square(960,t(465),15);
  fill(0);
  text("Force of Gravity", 990,t(450));
  
  
  rectMode(CENTER);
}

void displayValues(){
   textSize(16);
  rectMode(CORNER);
  fill(255);
  rect(920,t(400),280,350);
  fill(0);
  text("Values:", 925,t(380));
  // info for block 1
  textSize(15);
  text("Block 1:",930,t(350));
  textSize(14);
  text("Friction Force: " + fric1*mass1*sin(ang1)*g + " N", 930,t(330));
  text("Normal Force: " + mass1  * sin(ang1) * g + " N", 930,t(310) );
  text("Gravity Force: " + mass1*g + " N", 930,t(290));
  float temp = mass1*cos(ang1)*g+ fricStatic1*mass1*sin(ang1)*g;
  temp = temp - temp%0.001;
  text("Tension Force: " + temp + " N", 930,t(270));
  // info for block 2
  textSize(15);
  text("Block 2:",930,t(240));
  textSize(14);
  text("Friction Force: " + fric2*mass2*sin(ang2)*g + " N", 930,t(220));
  text("Normal Force: " + mass2 * sin(ang2) * g + " N", 930,t(200) );
  text("Gravity Force: " + mass2*g + " N", 930,t(180));
  float temp1 = mass2 * cos(-ang2) * g + fricStatic2*mass2*sin(ang2)*g;
  temp1 = temp1 - temp1%0.001;
  text("Tension Force: " +  temp1 + " N", 930,t(160));
  //other info
  textSize(15);
  text("Overall",930,t(130));
  textSize(14);
  String direc = "";
  float temp2 = a;
  temp2 = temp2 - temp2%0.01;

  if (a >= 0){
    direc = " left";
    text("Total Acceleration: " + nf(abs(temp2),0,3) + " m/s^2" + direc,930,t(110));

  }
  else if (a < 0){
    direc = " right";
    text("Total Acceleration: " + nf(abs(temp2),0,3) + " m/s^2" + direc,930,t(110));

  }
  if (buttonPressed){
    text("Speed of Block 1: " + nf( abs (v1),0,3) + " m/s" + direc,930,t(90));
    text("Speed of Block 2: " + nf(abs (v2),0,3) + " m/s" + direc,930,t(70));
  }
  else{
     text("Speed of Block 1: 0.000" +  " m/s" + direc,930,t(90));
    text("Speed of Block 2: 0.000"   + " m/s" + direc,930,t(70));
  }

  //println(a);
  
  //print(abs(v1));
  

  
  
  rectMode(CENTER);
}

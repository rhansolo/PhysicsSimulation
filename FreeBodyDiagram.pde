void drawFBD() {

  fill(255);
  rect(650, t(500), 500, 230);
  fill(0);
  textSize(16);
  text("Free Body Diagram:", 405, t(598));
  
  //pushMatrix();
  translate(500, t(490));
  rotate(ang1);
  fill(0);
  rect(0, 0, 20, 35);
  //popMatrix();
  reset(ang1,500,t(490));
  
  
  //pushMatrix();
  fill(0);
  translate(800, t(490));
  rotate(-ang2);
  rect(0, 0, 20, 35);
  //popMatrix();
  reset(-ang2,800,t(490));
  
  //fbd for block 1
  pushMatrix();
  stroke(200);
  translate(500, t(490));
  //work done by gravity
  stroke(0,128,0);
  arrow(0, 0, 0, mass1);

  rotate(ang1);
  //Normal Force
  stroke(255,165,0);
  arrow(0, 0,  -mass1  * sin(ang1), 0);
  if (a > 0 && fric1 != 0){
    //tension
  stroke(51,153,255);

    arrow(-10, 0, -10, -(mass1*cos(ang1)+ fricStatic1*mass1*sin(ang1)));
    //friction
    stroke(255,0,0);
    arrow(0, 0, 0,  -fric1*mass1*sin(ang1));
  }
  else{
    //tension
  stroke(51,153,255);

    arrow(0, 0, 0, -(mass1*cos(ang1)+ fricStatic1*mass1*sin(ang1)));
    //friction
    stroke(255,0,0);
    arrow(0, 0, 0,  fric1*mass1*sin(ang1));
  }
  //tension
  //arrow(0, 0, 0, -(mass1*cos(ang1)+ fricStatic1*mass1*sin(ang1)));

  //friction force
  //arrow(0, 0, 0,  fric1*mass1*sin(ang1));

  //arrow(0,0,80 * sin(ang1) * sin(ang1),0);
  popMatrix();


  //fbd for block 2
  pushMatrix();
  stroke(200);
  translate(800, t(490));
  //work done by gravity
  stroke(0,128,0);
  arrow(0, 0, 0, mass2 );

  rotate(-ang2);
  //Normal Force
  stroke(255,165,0);
  arrow(0, 0, mass2 * sin(ang2), 0);
  if (a < 0 && fric2 != 0 && ang2 != 0){
    //tension
  stroke(51,153,255);
    arrow(-10, 0, -10, -(mass2 * cos(-ang2) + fricStatic2*mass2*sin(ang2)));
    //friction
    stroke(255,0,0);
    arrow(0, 0, 0, -fric2*mass2*sin(ang2));
  }
  else{
    //tension
  stroke(51,153,255);
    arrow(0, 0, 0, -(mass2 * cos(-ang2) + fricStatic2*mass2*sin(ang2)));
    //friction
    stroke(255,0,0);
    arrow(0, 0, 0, fric2*mass2*sin(ang2));
  }
  //tension
  //arrow(0, 0, 0, -(mass2 * cos(-ang2) + fricStatic2*mass2*sin(ang2)));

  //friction force
  //arrow(0, 0, 0, fric2*mass2*sin(ang2));

  //arrow(0,0,80 * sin(ang1) * sin(ang1),0);
  popMatrix();
}


void arrow(float x1, float y1, float x2, float y2) {
  //print(x1 + " " + x2 + " " + y1 + " " + y2 + " | ");
  //stroke(255,0,0);
  if (x1 == x2 && y1 == y2){
      line(x1,y1,x2,y2);

  }
  else{
  line(x1, y1, x2, y2);
  //pushMatrix();
  translate(x2, y2);
  float a = atan2(x1-x2, y2-y1);
  rotate(a);
  line(0, 0, -5, -5);
  line(0, 0, 5, -5);
  //popMatrix();
  reset(a,x2,y2);
  }
} 

void reset(float ang, float x, float y){
   rotate(-ang);
   translate(-x, -y);

}

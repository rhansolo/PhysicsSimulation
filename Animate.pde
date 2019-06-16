void drawAnimate(){
  updateVelocity();
  //conditions check stopping
  if (conditionblock1()  || conditionblock2()){
     stay();
  }
  else{ 
    updateTime();
    animate1();
    animate2();
    drawCircle();
  }
}

void stay(){
  stroke(0);
    t = 0;
    
    //draw block 1
    translate(position1.x, position1.y);
    rotate(ang1);
    fill(26,27,32);
    rectMode(CENTER);
    rect(0, 0, 40, 70);
    label1();
    reset(ang1,position1.x,position1.y);
    

    // draw block 2
    translate(position2.x, position2.y);
    rotate(-ang2);
    fill(26,27,32);
    rectMode(CENTER);
    rect(0, 0, 40, 70); 
    label2();
    reset(-ang2,position2.x,position2.y);
   
    drawCircle();
}
void updateTime(){
  t = t + .1;
}
boolean conditionblock2(){
  return sqrt(sq(t(320) - position2.y) + sq(position2.x-500)) <= sqrt(sq(20) + sq(65));
}
boolean conditionblock1(){
  return sqrt(sq(t(320) - position1.y) + sq(500-position1.x)) <= sqrt(sq(20) + sq(65));
}

void animate1(){
  stroke(0);
  pushMatrix();
  calculate();
  updateVelocity();
  position1.add(velocity1);
  translate(position1.x, position1.y);
  rotate(ang1);
  fill(26,27,32);
  rectMode(CENTER);
  rect(0, 0, 40, 70);
  label1();
  popMatrix();
}

void animate2(){
  pushMatrix();
  stroke(0);
  calculate();
  //updateVelocity();
  position2.add(velocity2);
  translate(position2.x, position2.y);
  rotate(-ang2);
   fill(26,27,32);
  rectMode(CENTER);
  rect(0, 0, 40, 70);
  label2();
  popMatrix();
   
}


void updateVelocity(){
 //velocity1 = new PVector(.5*tan(ang1),-.5);
  velocity1 = new PVector(moving * -v1*sin(ang1),moving * v1*cos(ang1));
  //velocity2 = new PVector(-sin(-ang2)*sqrt(.25+.35*tan(ang1)*tan(ang1)) ,cos(-ang2)*sqrt(.25+.35*tan(ang1)*tan(ang1)));
  velocity2 = new PVector(moving * v2*sin(-ang2), moving * -v2 * cos(-ang2));
}

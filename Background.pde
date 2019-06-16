void drawQuadPlat1(){
  fill(139,75,115);
  quad(200, t(40), 200, t((40 + 280-(300.0/tan((ang1))))), 500, t(320), 500, t(40));
    tmpX1 = (.50 * 300) + 200;
    tmpY1 = t(10+(.50 * 300.0/tan(ang1)) + (20.0/tan(ang1)) + 40 + 280-(300.0/tan((ang1))));
    stroke(0);
    line(500,t(340),position1.x,position1.y);
}
void drawTriPlat1(){
  fill(139,75,115);
  quad(200+ 300*(1-tan(ang1)), t(40), 200+ 300*(1-tan(ang1)), t(40), 500, t(320), 500, t(40));

    // for when there is no incline
    if (ang1 == 0) {
      tmpY1 = t(170);
      tmpX1 = 190+ 300*(1-tan(ang1)) + (140 * tan(ang1) - 20 * cos(ang1));
      stroke(0);
      line(470,t(315),position1.x,position1.y);
    } else {
      // when there is a triangle 
      stroke(0);
      line(500,t(340),position1.x,position1.y);
      tmpY1 = t(140 + 20 * sin(ang1) + 30);
      tmpX1 = 200+ 300*(1-tan(ang1)) + (140 * tan(ang1) - 20 * cos(ang1));
      //ang1 = ang1 + .1;
    }
}
void drawQuadPlat2(){
  quad(500, t(40), 500, t(320), 800, t((40+280-(300/tan((ang2))))), 800, t(40));
    tmpX2 = (.50 * 300) + 500;
    tmpY2 = t(10+(.50 * 300/tan(ang2)) + (20/tan(ang2)) + 40 + 280-(300/tan((ang2))));
     stroke(0);
   line(500,t(340),position2.x,position2.y);

}
void drawTriPlat2(){
  quad(500, t(40), 500, t(320), 800- 300*(1-tan(ang2)), t(40), 800- 300*(1-tan(ang2)), t(40));

    if (ang2 == 0) {
      tmpY2 = t(170);
      tmpX2 = 810- 300*(1-tan(ang2)) - (140 * tan(ang2) - 20 * cos(ang2));
      line(530,t(315),position2.x,position2.y);

    } else {
      // when there is a triangle 
      stroke(0);
      line(500,t(340),position2.x,position2.y);
      tmpY2 = t(140 + 20 * sin(ang2) + 30);
      tmpX2 = 800- 300*(1-tan(ang2)) - (140 * tan(ang2) - 20 * cos(ang2));
      //ang1 = ang1 + .1;
    }
}
void drawBlock1(){
    //pushMatrix();
    stroke(0);
    position1 = new PVector(tmpX1,tmpY1);
    translate(tmpX1, tmpY1);
    rotate(ang1);
    fill(26,27,32);
    rectMode(CENTER);
    rect(0, 0, 40, 70);
    //popMatrix();
    label1();
    reset(ang1,tmpX1,tmpY1);
}
void label1(){
  fill(188,231,253);
  rotate(-PI/2);
    textSize(15);
    text("Block 1", -28, 4);
    rotate(PI/2);
}
void label2(){
  fill(188,231,253);
    rotate(PI/2);
    textSize(15);
    text("Block 2", -28, 4);
    rotate(-PI/2);
}
void drawBlock2(){
   //pushMatrix();
    position2 = new PVector(tmpX2,tmpY2);
    translate(tmpX2, tmpY2);
    rotate(-ang2);
    fill(26,27,32);
    rectMode(CENTER);
    rect(0, 0, 40, 70);
    //popMatrix();
    label2();
    reset(-ang2,tmpX2,tmpY2);
}
void drawCircle(){
    fill(175,59,110);
    stroke(0);
    circle(500, t(320), 60);
}
void drawStill(){
  drawBlock1();
  drawBlock2();
   drawCircle();

}

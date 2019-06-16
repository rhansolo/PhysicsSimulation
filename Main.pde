import controlP5.*; 
ControlP5 controlP5;
boolean animate = false;
boolean buttonPressed = false;
float tmpX1 = 0;
float tmpY1 = 0;
float tmpX2 = 0;
float tmpY2 = 0;
float t = 0;
float t(float cor) {
  return 640-cor;
}

void setup() {
  stroke(0);
  size(1230, 640);

  
  controlP5 = new ControlP5(this);
  // parameters : name, minimum, maximum, default value (float), x, y, width, height
  controlP5.addSlider("Angle 1", 0, 90, 60, 45, 40, 200, 20);
  controlP5.getController("Angle 1").getCaptionLabel().setColor(color(0,0,0) ).setSize(15);
  controlP5.addSlider("Angle 2", 0, 90, 60, 45, 70, 200, 20);
  controlP5.getController("Angle 2").getCaptionLabel().setColor(color(0,0,0) ).setSize(15);
  controlP5.addSlider("Friction of Block 1", 0, .5, 0, 45, 100, 200, 20);
  controlP5.getController("Friction of Block 1").getCaptionLabel().setColor(color(0,0,0) ).setSize(15);
  controlP5.addSlider("Friction of Block 2", 0, .5, 0, 45, 130, 200, 20);
  controlP5.getController("Friction of Block 2").getCaptionLabel().setColor(color(0,0,0) ).setSize(15);
  controlP5.addSlider("Mass of Block 1", 5, 100, 75, 45, 160, 200, 20);
  controlP5.getController("Mass of Block 1").getCaptionLabel().setColor(color(0,0,0) ).setSize(15);
  controlP5.addSlider("Mass of Block 2", 5, 100, 75, 45, 190, 200, 20);
  controlP5.getController("Mass of Block 2").getCaptionLabel().setColor(color(0,0,0) ).setSize(15);
  controlP5.addSlider("Mass of Pendulum", 5, 20, 5, 45, 220, 200, 20);
  controlP5.getController("Mass of Pendulum").getCaptionLabel().setColor(color(0,0,0) ).setSize(15);


  calculate();
  t = 0;
}


void draw() {
  background(190);
  stroke(0);
  fill(0);
  textSize(16);
  text("Sliders:", 45, t(608));
  //button for animation
  fill(120);
  rect(95, t(360), 100, 40);
  textSize(20);
  fill(188,231,253);
  text("Animate", 55, t(355));


  fill(100);
  // platform 1
  if (((40 + 280-(300/tan((ang1))))) < 40) {
    drawTriPlat1();
  } else {
    drawQuadPlat1();
  }
  //platform 2
  if (((40 + 280-(300/tan((ang2))))) < 40) {
    drawTriPlat2();
  } 
  else {
    drawQuadPlat2();
  }
  
  drawFBD();

  if (!animate) {
     drawStill();
  } else {
     drawAnimate();
  
  }
  displayValues();
  displayKey();

}

//HELPER FUNCTIONS
////////////////////////////////////////////////////////////////////////////////////////////////
void mousePressed() {
  rectMode(CORNERS);
  if (mouseX >= 95-50 && mouseX <= 95+50 && 
    mouseY >= t(360)-20 && mouseY <= t(360)+20 && !buttonPressed) {
    buttonPressed = !buttonPressed;

    animate =  true;
  } 
  else if (mouseX >= 95-50 && mouseX <= 95+50 && 
    mouseY >= t(360)-20 && mouseY <= t(360)+20 && buttonPressed) {
     //print("changed");
    buttonPressed = !buttonPressed;

    animate = false;
  }
  else{
    animate = false;
  }
  rectMode(CENTER);
}

void controlEvent(ControlEvent theEvent) {
  if (theEvent.isController()) { 
    if (theEvent.getController().getName()=="Angle 1") {
      ang1 = theEvent.getController().getValue() * PI / 180;
    }
    if (theEvent.getController().getName()=="Angle 2") {
      ang2 = theEvent.getController().getValue() * PI / 180;
    }
    if (theEvent.getController().getName()=="Friction of Block 1") {
      fric1 = theEvent.getController().getValue();
      fricStatic1 = fric1 + .2;
    }
    if (theEvent.getController().getName()=="Friction of Block 2") {
      fric2 = theEvent.getController().getValue();
      fricStatic2 = fric2 + .2;
    }
    if (theEvent.getController().getName()=="Mass of Block 1") {
      mass1 = theEvent.getController().getValue();
    }
    if (theEvent.getController().getName()=="Mass of Block 2") {
      mass2 = theEvent.getController().getValue();
    }
    if (theEvent.getController().getName()=="Mass of Pendulum") {
      massp = theEvent.getController().getValue();
    }
    buttonPressed = false;
    calculate();

  }
}

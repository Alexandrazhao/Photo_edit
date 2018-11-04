import controlP5.*;
ControlP5 cp5;
public float v1 = 2;
PFont myFont;
PImage sourceImg;
PImage targetImg;
PImage img;
CheckBox checkbox;
Brightness brightness;
Debrightness debrightness;
BandW bw;
RgbOrder rgbOrder;
Sepia sepia;
Fairy fairy;
Threshold threshold;
Trynew trynew;
Edgedetection edgedetection;
String imgName = ("IMG_9515.jpg");

void setup() {
  size(1, 1);
  //noLoop();
  targetImg = loadImage(imgName);
  sourceImg = loadImage(imgName);
  img = loadImage("IMG_1367.jpg");
  reset();
  //allow resize and update surface to image dimensions
  surface.setResizable(true);
  surface.setSize(targetImg.width, targetImg.height);
  brightness = new Brightness(1, 1, 1);
  debrightness = new Debrightness(1, 1, 1);
  bw = new BandW(1, 1, 1);
  rgbOrder = new RgbOrder(1, 1, 1);
  sepia = new Sepia(1, 1, 1); 
  fairy = new Fairy(1, 1, 1);
  threshold = new Threshold(1, 1, 1);
  trynew = new Trynew(1, 1, 1);
  edgedetection = new Edgedetection(1, 1);
  cp5 = new ControlP5(this);

  cp5.addSlider("v1")
    .setPosition(10, 20)
    .setSize(200, 20)
    .setRange(1, 3)
    .setValue(1)
    ;

  /* cp5.addToggle("lines")
   .setPosition(10,50)
   .setSize(80,20)
   .setMode(Toggle.SWITCH)
   ;*/
  //cp5.end();
  image(sourceImg, 0, 0);
  reset();
}

void reset() {
  targetImg = loadImage(imgName);
  sourceImg = loadImage(imgName);
  img = loadImage("IMG_1367.jpg");
  surface.setSize(sourceImg.width, sourceImg.height);
  brightness = new Brightness(1, 1, 1);
  debrightness = new Debrightness(1, 1, 1);
  bw = new BandW(1, 1, 1);
  rgbOrder = new RgbOrder(1, 1, 1);
  sepia = new Sepia(1, 1, 1); 
  fairy = new Fairy(1, 1, 1);
  threshold = new Threshold(1, 1, 1);
  trynew = new Trynew(1, 1, 1);
  edgedetection = new Edgedetection(1, 1);
  cp5 = new ControlP5(this);
  image(sourceImg, 0, 0);
}
void draw() { 

  brightness.show();
  //brightness.showrect();
  debrightness.show();
  //debrightness.showrect();
  //sepia.begin();
  sepia.show();
  //bw.begin();
  bw.show();
  rgbOrder.show();
  fairy.show();
  threshold.show();
  trynew.show();
  edgedetection.show();
  //sepia.begin();
  noStroke();
  fill(0, 79, 162, 200);
  rect(250, 0, 550, 30);
  textSize(10);
  fill(250, 77, 90, 200);
  myFont = createFont("hello", 15);
  textFont(myFont);
  text("dim light", 360, 20);
  text("on light", 260, 20);
  text("Grey", 460, 20);
  text("RgbOrder", 560, 20);
  text("Sepia", 660, 20);
  text("Reset", 750, 20);
  rect(250, 30, 550, 30);
  fill(0, 77, 90, 200);
  myFont = createFont("hello", 15);
  textFont(myFont);
  text("Fairey", 260, 50);
  text("Threshold", 360, 50);
  text("Try new", 460, 50);
  text("Edge", 560, 50);
  text("Save", 660, 50);

  // if (mousePressed) {
  //  if (mouseX>750 && mouseX <800  && mouseY > 0 && mouseY < 20) {
  // reset();
  //  }
  // }

  //rgbOrder.showrect();
  // popMatrix();
}
void mousePressed() {
  if (mouseX>750 && mouseX<800 && mouseY > 0 && mouseY < 20) {
    reset();
  } else if (mouseX>650 && mouseX < 750 && mouseY > 30 && mouseY < 60) {
    img.save(imgName+"_new.jpg");
    fill(100, 100, 100);
    strokeWeight(20);
    text("Image has been saved", 500, 500);
    //myFont = createFont("Hello",25);
  }
}
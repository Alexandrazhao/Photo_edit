class Threshold {
  float x, y, r;
  PFont myFont;


  Threshold(float x, float y, float r) {
    this.x = x;
    this.y = y;
    this.r = r;

    image(targetImg, 0, 0);
  }

 

  void show() {
    image(img, 0, 0);
    img.resize(width, height);
    if (mousePressed) {
      if (mouseX>350 && mouseX <450 && mouseY > 30 && mouseY <60) {

        for (int x = 0; x <img.width; x++) {
          for (int y = 0; y <img.height; y++) {
            int loc = x + y * img.width;
            float r =red (img.pixels[loc]);
            float g = green (img.pixels[loc]);
            float b = blue (img.pixels[loc]);
            float grayscale = ((r*g*b)/3);
            grayscale = constrain(grayscale, 0, 255);
            //float changeBrightness = map(v1,0,0,10,10);
            color c = color(grayscale);
            r = constrain(r, 0, 255);
            g = constrain(g, 0, 255);
            b = constrain(b, 0, 255);
            img.pixels[loc] = c;
            //make a nes color and set pixel in the window
          }
        }
      }
    }
    /*if(mouseX>550 && mouseX < 650 && mouseY > 30 && mouseY < 60){
     img.save(imgName+"_thres.jpg");
     //println("brightness");
     }*/
    println("threshold");
  }
 
}
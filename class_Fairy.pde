class Fairy {
  float x, y, r;
  PFont myFont;


  Fairy(float x, float y, float r) {
    this.x = x;
    this.y = y;
    this.r = r;

    image(targetImg, 0, 0);
  }

 

  void show() {
    image(img, 0, 0);
    img.resize(width, height);
    if (mousePressed) {
      if (mouseX>250 && mouseX <350 && mouseY > 30 && mouseY <60) {

        for (int x = 0; x <img.width; x++) {
          for (int y = 0; y <img.height; y++) {
            int loc = x + y * img.width;
            float r =red (img.pixels[loc]);
            float g = green (img.pixels[loc]);
            float b = blue (img.pixels[loc]);
            float sum = r+g+b;
            if (sum <=181) {
              color c = color(0, 51, 76);
              img.pixels[loc] = c;
            } else if (sum <= 363) {
              color c = color(217, 26, 33);
              img.pixels[loc] = c;
            } else if (sum <=545) {
              color c = color(112, 150, 158);
              img.pixels[loc]= c;
            } else if (sum <= 765) {
              color c = color(252, 227, 166);
              img.pixels[loc] = c;
            }
            //float changeBrightness = map(v1,0,0,10,10);

            r = constrain(r, 0, 255);
            g = constrain(g, 0, 255);
            b = constrain(b, 0, 255);

            //make a nes color and set pixel in the window
          }
        }
      }
    }
    /* if(mouseX>550 && mouseX < 650 && mouseY > 30 && mouseY < 60){
     img.save(imgName+"_fairey.jpg");
     //println("brightness");
     }*/
    println("brightness");
  }
  
}
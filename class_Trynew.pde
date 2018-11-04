class Trynew {
  float x, y, r;
  PFont myFont;


  Trynew(float x, float y, float r) {
    this.x = x;
    this.y = y;
    this.r = r;

    image(targetImg, 0, 0);
  }



  void show() {
    image(img, 0, 0);
    img.resize(width, height);
    if (mousePressed) {
      if (mouseX>450 && mouseX <550 && mouseY > 30 && mouseY <60) {
        int n1 = 181;
        int n2 = 363;
        int n3 = 545;
        int n4 = 765;
        for (int x = 0; x <img.width; x++) {
          for (int y = 0; y <img.height; y++) {
            int loc = x + y * img.width;
            float r =red (img.pixels[loc]);
            float g = green (img.pixels[loc]);
            float b = blue (img.pixels[loc]);
            float sum = r+g+b;
            if (sum <=n1) {
              color c = color(255, 230, 255);
              img.pixels[loc] = c;
            } else if (sum <= n2) {
              color c = color(128, 0, 0);
              img.pixels[loc] = c;
            } else if (sum <=n3) {
              color c = color(153, 204, 255);
              img.pixels[loc]= c;
            } else if (sum <= n4) {
              color c = color(255, 204, 0);
              img.pixels[loc] = c;
            }
            //float changeBrightness = map(v1,0,0,10,10);

            /*r = constrain(r, 0, 255);
             g = constrain(g, 0, 255);
             b = constrain(b, 0, 255);*/

            //make a nes color and set pixel in the window
          }
        }
      }
    }
    /*if(mouseX>550 && mouseX < 650 && mouseY > 30 && mouseY < 60){
     img.save(imgName+"_new.jpg");
     //println("brightness");
     }*/
    // noLoop();
    println("brightness");
  }
}
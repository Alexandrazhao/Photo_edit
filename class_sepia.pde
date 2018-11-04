class Sepia {
  float x, y, r;
  PFont myFont;


  Sepia(float x, float y, float r) {
    this.x = x;
    this.y = y;
    this.r = r;

    image(targetImg, 0, 0);
  }

  void begin() {
    //get the original color in the picture
    img.loadPixels();
    img.loadPixels();
    for (int y = 0; y < height; y++) {
      for (int x = 0; x<width; x++) {
        int loc = x + y*width;
        float r = red(img.pixels[loc]);
        float g = green(img.pixels[loc]);
        float b = blue(img.pixels[loc]);
        //image processing would go here
        //set the diaplay pixel to the img pixel
        img.pixels[loc] = color(r, g, b);
      }
    }
  }

  void show() {
    image(img, 0, 0);
    img.resize(width, height);
    if (mousePressed) {
      if (mouseX>650 && mouseX <750 && mouseY > 0 && mouseY <30) {

        for (int x = 0; x <img.width; x++) {
          for (int y = 0; y <img.height; y++) {
            int loc = x + y * img.width;
            float r =red (img.pixels[loc]);
            float g = green (img.pixels[loc]);
            float b = blue (img.pixels[loc]);

            //float changeBrightness = map(v1,0,0,10,10);
            float sepiaAmount = 20;
            r = constrain(r, 0, 255);
            g = constrain(g, 0, 255);
            b = constrain(b, 0, 255);

            //make a nes color and set pixel in the window
            color c = color(r+sepiaAmount, g + sepiaAmount, b-sepiaAmount);
            img.pixels[loc] = c;
          }
        }
      }
    }

    println("sepia");
  }
}
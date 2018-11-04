class Edgedetection {
  //set a two dimension image array
  int x = img.width; //the x-direction kernel detectes horizontal lines
  int y = img.height; //the y-direction kernel setects vertical lines
  int maxGval = 0;
  int[][] edgeColors = new int[x][y];
  int maxGradient=-1;

  //use the 3*3 kernel to compare ajcent pixels

  Edgedetection(int x, int y) {
    this.x = x;
    this.y = y;
  }  

  void show() {
    image(img, 0, 0);
    img.resize(width, height);
    if (mousePressed) {
      if (mouseX>550 && mouseX < 650 && mouseY>30 && mouseY < 60) {
        //loop over each pixel of the image
        for (int i = 1; i< width-1; i++) {
          for (int j = 1; j<height-1; j++) {
            //set the grayscale to each pixel

            int val00 = grayScale(img.get(i-1, j-1)); //get color in xy and convert them to grayscale
            int val01 = grayScale(img.get(i-1, j));
            int val02 = grayScale(img.get(i-1, j+1));

            int val10 = grayScale(img.get(i, j-1));
            int val11 = grayScale(img.get(i, j));
            int val12 = grayScale(img.get(i, j+1));

            int val20 = grayScale(img.get(i+1, j-1));
            int val21 = grayScale(img.get(i+1, j));
            int val22 = grayScale(img.get(i+1, j+1));

            //output pixel
            //calculate the derivative of grayscale
            //the changes from the target pixel to its ajcent pixel
            int gx = ((-1*val00)+(0*val01)+(1*val02))
              +((-2*val10)+(0*val11)+(2*val12))
              +((-1*val20)+(2*val21)+(1*val22));
            int gy = ((-1*val00)+(-2*val01)+(-1*val02))
              +((0*val10)+(0*val11)+(0*val12))
              +((1*val20)+(2*val21)+(1*val22));


            //double val = Math.sqrt((gx*gx)+(gx*gx));
            //double val = Math.sqrt((gy*gy)+(gy*gy));
            double val = Math.sqrt((gx*gx)+(gy*gy));
            //the magnitude of the gradient is simply the sum of these 2 gradients x and y
            //double val = Math.abs(gx) + Math.abs(gy); similar
            //cast double to int
            int g1 = (int) val;
            //find the biggest gradient
            if (maxGradient <g1) {
              maxGradient = g1;
            }
            edgeColors[i][j] = g1;
          }
        }
        //nomallize all the gradients
        float scale = 255.0/maxGradient;
        for (int i =1; i<width-1; i++) {
          for (int j = 1; j<height-1; j++) {
            int edgeColor = edgeColors[i][j];
            edgeColor = (int)(edgeColor*scale);
            //using gradient value to color
            //encode rgb color to a single integer
            //source:https://stackoverflow.com/questions/19277010/bit-shift-and-bitwise-operations-to-encode-rgb-values
            edgeColor = 0xff000000 | (edgeColor << 16) | (edgeColor << 8) | edgeColor; //set color to grayscale
            //show the image
            //set the color of the image
            img.set(i, j, edgeColor); //rgb value
          }
        }
      }
    }
  }     
  //0xAARRGGBB AA:transparency, RR:red, GG:green, BB:blue
  public int grayScale(int rgb) {
    //give the brightness of the color in rgb
    int r = (rgb >> 16)& 0xff;
    int g = (rgb>>8) & 0xff;
    int b = (rgb)& 0xff;
    //cast the float to integer Calculate the grayscale, the illumience.
    //https://en.wikipedia.org/wiki/Grayscale 
    //converting color to grayscale
    int gray = (int)(0.2126*r+0.7152*g+0.0722*b);
    return gray;
  }
}
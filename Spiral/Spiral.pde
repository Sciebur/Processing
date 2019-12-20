float dSize;
float dRot;
int dHue;

float upperBound = 0.97;

ArrayList<Square> squares = new ArrayList<Square>();

void setup()
{
  //size(500, 500);
  fullScreen();
  frameRate(50);
  background(0);
  colorMode(HSB);


  float lSize = height;
  while (lSize > 1){
    squares.add(new Square());
    lSize *= 0.8;
  }
}

void draw()
{
  float size = height;
  float rotation = 0;
  int hue = 0;

  dSize = map(mouseY, 0, height, 0.8, 0.97);
  dRot = map(mouseX, 0, width, -0.1, 0.1) * TAU;

  dHue = floor(255.0 / squares.size());
  

  background(0); 
  for (Square square : squares)
  {
    size *= dSize;
    rotation += dRot;
    if (hue >= 255)  hue=0; else  hue+=dHue;
    square.show(size, rotation, color(hue, 255, 255));
  }
}

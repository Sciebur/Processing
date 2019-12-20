float density = 3;
float hSpace = 25;
ArrayList<Char> chars = new ArrayList<Char>();

void setup()
{

  size(500, 500);
  //fullScreen();
  frameRate(15);
  background(0);

  int elements = floor(width / hSpace * density);

  float lastPosX = 0;
  for (int i = 0; i < elements; i++) 
  {
    chars.add(new Char(lastPosX));
    lastPosX += hSpace;
    if (lastPosX > width)
      lastPosX = 0;
  }
}

void draw()
{
  background(0);

  for (Char element : chars)
  {
    element.show();
    element.move();
  }
}

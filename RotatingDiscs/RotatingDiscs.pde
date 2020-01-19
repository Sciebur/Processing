int lineWidth = 14;
int lineSpacing = 40;
float animationTime = 5;


float animationFrames;
int count;

void setup()
{
  size(500, 500);
  //fullScreen();
  frameRate(60);
  background(0);
  colorMode(RGB);

  animationFrames = frameRate * animationTime;
  count = floor(height / lineSpacing);
}

void draw()
{
  background(0);
  noFill();
  stroke(255);
  strokeWeight(lineWidth);
  strokeCap(SQUARE);

  translate (width/2, height/2);
   
  float rotation = map(frameCount, 0, animationFrames, 0, TAU);  

  for (int i = 1; i < count; i++)
  {
    rotate(rotation);
    arc(0, 0, i * lineSpacing, i * lineSpacing, 0, TAU/2);
  }
}

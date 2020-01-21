int lineWidth = 14;
int lineSpacing = 40;
float animationFrames = 300;

int count;

import gifAnimation.*;
GifMaker gifExport;

void setup()
{
  size(500, 500);
  //fullScreen();
  frameRate(60);
  background(0);
  colorMode(RGB);

  count = floor(height / lineSpacing);
  
  gifExport = new GifMaker(this, "animation.gif");
  gifExport.setRepeat(0);
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
  
  if (frameCount <= animationFrames)
  {
  gifExport.setDelay(16);
  gifExport.addFrame();
  println(frameCount);
  }

  if (frameCount == animationFrames)
  {
    boolean ret = gifExport.finish();
    println("Recording done! result: " + ret);
  }
}

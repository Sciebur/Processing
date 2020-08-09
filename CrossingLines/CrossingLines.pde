int lineWidth = 14;
int lineSpacing = 25;
float slidingFrames = 50;
float rotationFrames = 500000;
boolean recording = true; 

import gifAnimation.*;
GifMaker gifExport;

float lineLength;
int count;

void setup()
{
  size(800, 800);
  //fullScreen();
  frameRate(50);
  background(0);
  colorMode(RGB);
  
  count = floor(height/lineWidth);
  lineLength = height/3;
  
  gifExport = new GifMaker(this, "animation.gif");
  gifExport.setRepeat(0);
  //gifExport.setTransparent(0,0,0);
}

void draw()
{
  background(0);
  stroke(255);
  strokeWeight(lineWidth);
  strokeCap(ROUND);

  translate (width/2, height/2);
  rotate(map(frameCount, 0, rotationFrames, 0, TAU));
 
  float phase = map(frameCount, 0, slidingFrames, 0, TAU); 

  for (int i = -count/2; i< count/2; i++)
  {
    float shift = map(i, 0, count, -PI, PI);
    float rotation = sin(phase+shift) * (width/2 - lineLength/2) - lineLength/2; 
    line (rotation, i*lineSpacing, rotation + lineLength, i*lineSpacing);
    line (i*lineSpacing, rotation, i*lineSpacing, rotation + lineLength);
  }
  
  if (frameCount <= slidingFrames)
  {
  gifExport.setDelay(16);
  gifExport.addFrame();
  println(frameCount);
  }

  if (frameCount == slidingFrames)
  {
    boolean ret = gifExport.finish();
    println("Recording done! result: " + ret);
  }
}

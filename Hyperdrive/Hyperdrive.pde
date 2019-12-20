Star[] stars = new Star[500];

void setup()
{
  //size(500,500);
  fullScreen();
  background(0);
  frameRate(120);
  
  for (int i = 0; i < stars.length; i++) {
    stars[i] = new Star();
  }

}

void draw()
{
   background(0);
   pushMatrix();
   translate(width/2, height/2);

   
  for (Star star : stars)
  {
    star.show();
    star.move();
  }
  
  popMatrix();
}

void keyPressed()
{
  color c;
  switch (key)
  {
   case 'r':
     c = color(255, 0, 0);
     break;
   case 'g':
     c = color(0, 255, 0);
     break;
   case 'b':
     c = color(0, 0,255);
     break;
   case 'l':
     c = color(random(255), random(255), random(255));
     break;
   default:
     c = color(120, 120,120);
     break;
  }
 
  for (Star star : stars)
  {
    star.changeColor(c);
  }
}

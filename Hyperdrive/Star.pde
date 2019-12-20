class Star
{
 float radius;
 float fi;
 float r;
 float opaque;
 
 float fiPrev;
 float rPrev;
 boolean repositioned;
 
 color m_color;
 
 float accel = 1.05;
 float growth = 1.05;
 
 Star()
 {
   fi = random(TAU);
   r = random(sqrt(2)*width/2);
   radius = random(3,6);
   opaque = random(0,50);
   repositioned = true;
   m_color = color(255,255,255);
 }
 
 void show()
 {     
   noStroke();
   fill(m_color,opaque);
   circle(r*cos(fi), r*sin(fi),radius);
   
   if (!repositioned)
   {
   stroke(m_color,opaque);
   strokeWeight(3);
   line(r*cos(fi), r*sin(fi), rPrev*cos(fiPrev), rPrev*sin(fiPrev));
   }
 }
 
 void move()
 {
   fiPrev = fi;
   rPrev = r;
   
  accel = map(mouseY, 0, height, 1.2, 1.0);
  growth = map(mouseY, 0, height, 1.0, 0.5); 
   
  r *= accel;
  radius *= growth * r/1000;
  
  if (repositioned)
    repositioned = false;
  
  if (r > sqrt(2)*width/2)
  {
    r = random(sqrt(2)*width/2);
    radius = random(3,6);
    opaque = 0;
    repositioned = true;
  }
  
  if (opaque < 255)
  {
     opaque += map(r, 0, sqrt(2)*width/2, 0,20); 
  }
 }
 
 void changeColor(color c)
 {
   m_color = c;
 }
 
}

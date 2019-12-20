class Square
{
  Square ()
  {
  }

  void show(float size, float rot, color c)
  {
    pushMatrix();
   
    stroke(c);
    //strokeWeight(stroke);
    noStroke();
    
    fill(c);
    //noFill();
    
    translate(width/2, height/2);
    rotate(rot);
    square(-size/2,-size/2, size);
    popMatrix();    
  }


}

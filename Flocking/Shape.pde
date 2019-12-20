class Shape
{
  color col;
  int size = 10;
  float rotation = PI*8/10;

  Shape(color _col)
  {
    col = _col;
    strokeWeight(1);
  }

  void show(PVector pos, PVector vel)
  {
    stroke(col);

    vel = vel.normalize().mult(size);

    PVector head = pos.copy().add(vel);
    PVector tailL = pos.copy().add(vel.copy().rotate(rotation));
    PVector tailR = pos.copy().add(vel.copy().rotate(-rotation));

    line(head.x, head.y, tailL.x, tailL.y);
    line(head.x, head.y, tailR.x, tailR.y);

    line(pos.x, pos.y, tailR.x, tailR.y);
    line(pos.x, pos.y, tailL.x, tailL.y);
  }
};

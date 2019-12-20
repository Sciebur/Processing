class Wall
{
  PVector m_begin;
  PVector m_end;

  Wall(PVector begin, PVector end)
  {    
    m_begin = begin;
    m_end = end;
  }

  void show()
  {
    stroke(#FBFBFB);
    strokeWeight(2);
    line(m_begin.x, m_begin.y, m_end.x, m_end.y);
  }

  PVector calculateDistance(PVector point)
  {    
    PVector line1 = point.copy().sub(m_begin);
    PVector line2 = m_end.copy().sub(m_begin);

    float angle = line1.heading() - line2.heading();
    PVector mirror = line1.copy().rotate(-2*angle).add(m_begin);

    PVector result = mirror.sub(point);
    result.div(2);

    return result;
  }
};

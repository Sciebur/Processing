color g_color = color(30, 255, 30);

class Cell
{
  float m_posX;
  float m_posY;
  char m_char;
  float m_opac;
  int m_age;

  Cell(float x, float y, char c)
  {
    m_posX = x;
    m_posY = y;
    m_char = c;
    m_opac = 255;
  }

  void show()
  {
       //println(m_char, " ", m_opac);
    fill(g_color, m_opac);
    textSize(g_vSpace * 0.75);
    text(m_char, m_posX, m_posY);
  }
  
  void fadeOut()
  {
   m_age++;
   m_opac = 255/ m_age;   
  }
  
  void changeChar(char newChar)
  {
   m_char = newChar;
   m_age = 0;
  }
}

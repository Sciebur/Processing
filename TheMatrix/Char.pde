float step = 25;
int numberOfShadows = 20;

class Char
{
  color m_color;
  float m_posX;
  float m_posY;
  char[] history = new char[numberOfShadows];

  Char(float posX)
  {
    m_color  = color(30, 255, 30);
    m_posY = step * random(height/step + numberOfShadows);
    m_posX = posX;

    for (int i = 0; i < history.length; i++) 
    {
      history[i] = ' ';
    }
  }

  void show()
  {
    char c = (char) int(random(33, 127));
    fill(m_color);
    textSize(step-5);
    text(c, m_posX, m_posY);

    showShadows();
    appendToHistory(c);
  }

  void move()
  {
    m_posY += step;
    if (m_posY > height + step*numberOfShadows)
      m_posY = -step;
  }

  private void showShadows()
  {
    for (int i = 0; i < numberOfShadows; i++)
    {
      fill(m_color, 255/(i+1));
      textSize(step-5);
      text(history[i], m_posX, m_posY - step*(i+1));
    }
  }

  private void appendToHistory(char newChar)
  {
    for (int i = history.length - 1; i > 0; i--)
    {
      history[i] = history[i-1];
    }

    history[0] = newChar;
  }
}

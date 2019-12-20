class Changer
{
  int m_col;
  int m_cell;
  
  Changer(int col, int cell)
  {
    m_col = col;
    m_cell = cell;
  }
  
  Coords tick()
  {
    m_cell++;
    if (m_cell > g_rows - 1)
      m_cell = 0;

    return new Coords(m_col, m_cell);
  }
}

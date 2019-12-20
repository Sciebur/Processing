int fadeTicks = 30;
float density = 3.5;

ArrayList<ArrayList<Cell>> grid = new ArrayList<ArrayList<Cell>>();
ArrayList<Changer> changers = new ArrayList<Changer>();
float g_vSpace = 20;
float g_hSpace = 20;
int g_rows;
int g_cols;
int g_perCol;

void setup()
{

  //size(500, 500);
  fullScreen();
  frameRate(12);
  background(0);

  g_rows = floor(height / g_vSpace);
  g_cols = floor(width / g_hSpace);
  
  g_perCol = ceil(density * g_rows / fadeTicks);
  println(g_cols, g_rows, g_perCol);

  // grid is column-wise
  float posX = 0;
  for (int i = 0; i < g_cols; i++, posX += g_hSpace)
  {
    float posY = 0;
    ArrayList<Cell> column = new ArrayList<Cell>(); 
    for (int j = 0; j < g_rows; j++, posY += g_vSpace)
    {
      column.add(new Cell(posX, posY, ' '));
    }
    grid.add(column);
  }

  for (int i = 0; i < g_cols; i++)
  {
    for (int j = 0; j < g_perCol; j++)
    {
      changers.add(new Changer(i, int(random(g_rows))));
    }
  }
}

void draw()
{
  background(0);

  for (ArrayList<Cell> col : grid)
  {
    for (Cell cell : col)
    {
      cell.show(); 
      cell.fadeOut();
    }
  }

  for (Changer changer : changers)
  {
    Coords coords = changer.tick();
    char c = (char) int(random(33, 127));
    grid.get(coords.col).get(coords.cell).changeChar(c);
  }
  
  //////
  //saveFrame("film/TheMatrix-#######.tga");
}

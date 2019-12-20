int cellSize = 5;

int rows;
int cols;

Cell[][] grid;

void setup()
{
  //fullScreen();
  size(700,700);
  
  background(210);
  frameRate(60);
  
   rows = floor(height/cellSize);
   cols = floor(width/cellSize);
   grid = new Cell[rows][cols];

  for (int i = 0; i < rows; i++)
  { 
   for (int j = 0; j < cols; j++)
    {
      boolean startAlive = random(1) > 0.75; 
      grid[i][j] = new Cell(i ,j, startAlive);
    }
  }
  
}

void draw()
{
  background(210);
  for (Cell[] row : grid)
  {
    for (Cell cell : row)
    {
      cell.update();
    }
  }
  for (Cell[] row : grid)
  {
    for (Cell cell : row)
    {
        cell.show();
    }
  }
}

void mouseDragged()
{
  int clickX = int(map(mouseX, 0, width, 0, cols));
  int clickY = int(map(mouseY, 0, height, 0, rows));
  
  grid[clickX][clickY].alivePrev = true;
}

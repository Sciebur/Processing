class Cell
{
  int x;
  int y;
  float size;
  
  boolean alive;
  boolean alivePrev;
  
 Cell(int _x, int _y, boolean _alive)
 {
   x = _x;
   y = _y;
   alivePrev = _alive;
   alive = _alive;
 }
  
 void show()
  {
    alivePrev = alive;
    
    fill(10);
    stroke(50);
    if (alive)
     {          
        square(x*cellSize, y*cellSize, cellSize); 
     }
  }
  
  void update()
  {
    int neigh = aliveNeighbours();
    
    if (neigh < 2 || neigh > 3)
      alive = false;
      
    if (alivePrev && (neigh == 2 || neigh == 3))
      alive = true;
      
    if (!alivePrev && neigh == 3)
      alive = true;
  }
  
  int aliveNeighbours()
  {
    int neigh = 0;
    
    boolean top = y == 0;
    boolean bot = y == rows-1;
    boolean left = x == 0;
    boolean right = x == cols-1;
    
    if(!top   && grid[x][y-1].alivePrev)
      neigh++;
    if(!bot   && grid[x][y+1].alivePrev)
      neigh++; 
    if(!left  && grid[x-1][y].alivePrev)
      neigh++;
    if(!right && grid[x+1][y].alivePrev)
      neigh++;
    
    if(!top && !left  && grid[x-1][y-1].alivePrev)
      neigh++;
    if(!top && !right && grid[x+1][y-1].alivePrev)
      neigh++; 
    if(!bot && !left  && grid[x-1][y+1].alivePrev)
      neigh++;
    if(!bot && !right && grid[x+1][y+1].alivePrev)
      neigh++;
    
    return neigh;
  }
}

class Cell
{
  boolean mAlive;
  boolean mAlivePrev;
  
  int mRow;
  int mCol;

  Cell(int rowId, int colId)
  {
    mAlive = random(1) > gAliveTreshold;
    mAlivePrev = mAlive;
    
    mRow = rowId;
    mCol = colId;
  }

  void goAlive() 
  {
    mAlive = true;
  }

  void goDead()
  {
    mAlive = false;
  }

  boolean isAlive()
  {
    return mAlivePrev;
  }

  void swapBuffer()
  {
    gGrid.setElement (mRow, mCol, mAlive);
    mAlivePrev = mAlive;
  }
}

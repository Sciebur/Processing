class Grid
{
  ArrayList<ArrayList<Boolean>> mGrid = new ArrayList<ArrayList<Boolean>>();
  ArrayList<ArrayList<Boolean>> mGridPrev = new ArrayList<ArrayList<Boolean>>();

  ArrayList<ArrayList<Boolean>> mTemp;

  Boolean mTrue = new Boolean(true);
  Boolean mFalse = new Boolean(false);


  Grid()
  {
    for (int i = 0; i < gRows; i++)
    {
      ArrayList<Boolean> row = new ArrayList<Boolean>();
      for (int j = 0; j < gCols; j++)
      {
        row.add( random(1) > gAliveTreshold ? mTrue : mFalse);
      }
      mGrid.add(row);
    }
    for (int i = 0; i < gRows; i++)
    {
      ArrayList<Boolean> row = new ArrayList<Boolean>();
      for (int j = 0; j < gCols; j++)
      {
        row.add( random(1) > gAliveTreshold ? mTrue : mFalse);
      }
      mGridPrev.add(row);
    }
  }

  void update()
  {
    for (int i = 0; i < gRows; i++)
    {
      for (int j = 0; j < gCols; j++)
      {
        int count = countNeighbours(i, j);

        if (mGridPrev.get(i).get(j).booleanValue())
        {
          if (count <= 1 || count >= 4)
            mGrid.get(i).set(j, mFalse);
        } else //was dead
        {
          if (count == 3)
            mGrid.get(i).set(j, mTrue);
        }
      }
    }

    pushBuffer();
  }

  int countNeighbours(int row, int col)
  {
    int count = 0;
    count += alive(row-1, col-1);
    count += alive(row-1, col);
    count += alive(row-1, col+1);

    count += alive(row, col-1);
    count += alive(row, col);
    count += alive(row, col+1);

    count += alive(row+1, col-1);
    count += alive(row+1, col);
    count += alive(row+1, col+1);

    return count;
  }

  int alive(int row, int col)
  {
    try 
    {
      return mGridPrev.get(row).get(col).booleanValue() ? 1 : 0;
    }
    catch (Exception e)
    {
      return 0;
    }
  }

  ArrayList<ArrayList<Boolean>> getGrid()
  {
    return mGridPrev;
  }

  void pushBuffer()
  {    
    for (int i = 0; i < gRows; i++)
    {
      for (int j = 0; j < gCols; j++)
      {
        if (!mGridPrev.get(i).get(j).equals(mGrid.get(i).get(j)))
        {
          if (mGridPrev.get(i).get(j).booleanValue())
            mGridPrev.get(i).set(j, mFalse);
          else
            mGridPrev.get(i).set(j, mTrue);
        }
      }
    }
  }
  
};

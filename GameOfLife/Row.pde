class Row
{
  ArrayList<Cell> mCells = new ArrayList<Cell>();
  int mId;

  Row(int rowId)
  {
    mId = rowId;

    for (int i=0; i < gCols; i++)
    {
      mCells.add(new Cell(rowId, i));
    }
  }

  void update()
  {
    for (int i=0; i< gCols; i++)
    {
      int count = countRowCurrent(i) + countRowAbove(i) + countRowBelow(i);

      if (count <= 1 || count >= 4)
        mCells.get(i).goDead();
      else if (count == 3)
        mCells.get(i).goAlive();
      //else if 2: stay in current state
    }
  }

  void finalizeUpdate()
  {
    for (Cell cell : mCells)
    {
      cell.swapBuffer();
    }
  }

  int countRowCurrent(int index)
  {
    int count = 0; //<>//
    count += mCells.get(index).isAlive() ? 1 : 0;

    count += (index == 0) ? 0 : (mCells.get(index - 1).isAlive() ? 1 : 0);
    count += (index == mCells.size() - 1 ) ? 0 : (mCells.get(index + 1).isAlive() ? 1 : 0);
    return count;
  }

  int countRowAbove(int index)
  {
    return gGrid.getCountInRow(mId - 1, index);
  }

  int countRowBelow(int index)
  {
    return gGrid.getCountInRow(mId + 1, index);
  }
};

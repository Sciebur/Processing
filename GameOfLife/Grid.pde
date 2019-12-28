class Grid
{
  ArrayList<ArrayList<Boolean>> mGrid = new ArrayList<ArrayList<Boolean>>();
  ArrayList<Row> mRows = new ArrayList<Row>();

  Grid()
  {
    for (int i = 0; i < gRows; i++)
    {
      ArrayList<Boolean> row = new ArrayList<Boolean>();
      for (int j = 0; j < gCols; j++)
      {
        row.add(new Boolean(false));
      }
      mGrid.add(row);
    }

    for (int i = 0; i < gRows; i++)
    {
      mRows.add(new Row(i));
    }
  }

  int getCountInRow(int rowId, int cellId)
  {
    if (rowId > mRows.size() -1  || rowId < 0)
      return 0;

    return mRows.get(rowId).countRowCurrent(cellId);
  }

  void update()
  {
    //TODO vectorization
    for (Row row : mRows)
    {
      row.update();
    }

    for (Row row : mRows)
    {
      row.finalizeUpdate();
    }
  }

  void setElement(int row, int col, boolean state)
  {
    mGrid.get(row).set(col, new Boolean(state));
  }

  ArrayList<ArrayList<Boolean>> getGrid()
  {
    return mGrid;
  }
};

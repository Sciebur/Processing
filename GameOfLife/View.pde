class View
{
  int mAliveCount;
  View ()
  {
  }

  void show()
  {
    mAliveCount = 0;

    for (int i = 0; i < gGrid.getGrid().size(); i++)
    {
      for (int j = 0; j < gGrid.getGrid().get(i).size(); j++)
      {
        if (gGrid.getGrid().get(i).get(j).booleanValue() == true)
        {
          fill(255);
          noStroke();
          square(j * gSize, i * gSize, gSize);
          mAliveCount++;
        }
      }
    }

    println(mAliveCount);
  }
};

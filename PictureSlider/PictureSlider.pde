int scrambleSteps = 1;
int[] values;
int bubbleTop;

void setup()
{
  size(500, 500);
  //fullScreen();
  frameRate(100);
  //background(0);

  PImage myImage = loadImage("sample.jpg");
  image(myImage, 0, 0);

  bubbleTop = width*height -1;

  initValues();
  scramble();
  
}

void draw()
{
  randomSort();
  bubbleSortVertical();
  bubbleSort();
}

void scramble()
{
  loadPixels();
  for (int step = 0; step < scrambleSteps; step++)
  {   
    for (int i = 0; i < width*height; i++) //for each pixel 
    {
      int first = i;
      int second = int(random(height*width));

      // swap pixel with random one in the row
      color tempC = pixels[first];
      pixels[first] = pixels[second];
      pixels[second] = tempC;

      int tempV = values[first];
      values[first] = values[second];
      values[second] = tempV;
    }
  }
  updatePixels();
}

void initValues()
{
  values = new int[width*height];  
  for (int i = 0; i < width*height; i++) //for each pixel 
  {
    values[i] = i;
  }
}

void bubbleSort()
{
  for (int i = 0; i < bubbleTop; i++) //for each pixel 
  {
    int curr = i;

    if (values[curr] > values[curr+1]) //bubble sort
    {
      color tempC = pixels[curr];
      pixels[curr] = pixels[curr+1];
      pixels[curr+1] = tempC;

      int tempV = values[curr];
      values[curr] = values[curr+1];
      values[curr+1] = tempV;
    }
  }
  updatePixels();
  bubbleTop--;
}

void bubbleSortVertical()
{
  for (int i = 0; i < width*(height-1)-1; i++) //for each pixel w/o last row 
  {
    int curr = i;

    if (values[curr] > values[curr+width]) //bubble sort
    {
      color tempC = pixels[curr];
      pixels[curr] = pixels[curr+width];
      pixels[curr+width] = tempC;

      int tempV = values[curr];
      values[curr] = values[curr+width];
      values[curr+width] = tempV;
    }
  }
  updatePixels();
  bubbleTop--;
}

void randomSort()
{
    for (int i = 0; i < width*height; i++) //for each pixel 
  {
    int curr = i;
    int rand = int(random(height*width));


    if (curr < rand && values[curr] > values[rand]
      || curr > rand && values[curr] < values[rand])
    {
      color tempC = pixels[curr];
      pixels[curr] = pixels[rand];
      pixels[rand] = tempC;

      int tempV = values[curr];
      values[curr] = values[rand];
      values[rand] = tempV;
    }
  }
  updatePixels();
}

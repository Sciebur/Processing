int gSize = 2;
float gAliveTreshold = 0.5;


Grid gGrid;
View gView;
int gRows;
int gCols;

void setup()
{
  fullScreen();
  //size(695, 704);

  gRows = height;
  gCols = width;
  println(gRows, gCols);

  background(0);
  frameRate(20);

  gGrid = new Grid();
  gView = new View();
}

void draw()
{
  gGrid.update();

  background(0, 0, 10);
  gView.show();
}

//void mouseDragged()
//{
//  int clickX = int(map(mouseX, 0, width, 0, gCols));
//  int clickY = int(map(mouseY, 0, height, 0, gRows));

//  gGrid.setElement (clickY,clickX, true);
//}

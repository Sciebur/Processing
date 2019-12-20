//TODO 
//mouse as POI
//opt - spatial subdivision
//interface - radii, maxForces, maxSpeeds
//cone of view

Wall[] walls = new Wall[4];

//int[] flockSizes = { 15, 15, 15, 15, 15, 15, 15, 15, 15, 15, 15, 15 };
int[] flockSizes = {50,50,50};
Boid[][] flocks;

void setup()
{
  //size(500, 700);
  fullScreen();
  background(0);
  frameRate(60);
  //frameRate(2);

  BoidFactory factory = new BoidFactory();
  flocks = factory.create(flockSizes);  


  //walls[0] = new Wall( new PVector(width/2, 0), new PVector(width/2, height) );
  walls[0] = new Wall( new PVector(0, 0), new PVector(width, 0) );
  walls[1] = new Wall( new PVector(width, 0), new PVector(width, height) );
  walls[2] = new Wall( new PVector(width, height), new PVector(0, height) );
  walls[3] = new Wall( new PVector(0, height), new PVector(0, 0) );

  //walls[4] = new Wall( new PVector(width*3/8, height*1/8), new PVector(width*5/8, height*3/8) );
}

void draw()
{
  background(0);

  for (Boid[] flock : flocks)
  {
    for (Boid boid : flock)
    {     
      boid.flock(flock, walls);
    }
    for (Boid boid : flock)
    {
      boid.update();
      boid.show();
    }
  }

  for (Wall wall : walls)
  {
    wall.show();
  }
}

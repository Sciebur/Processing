class Boid
{

  int perception_a = 100;
  int perception_c = 150;
  int perception_s = 30;
  int perception_o = 100;

  float force_a = 5;
  float force_c = 8;
  float force_s = 20;
  float force_o = 10000;

  float maxSpeed = 5;
  float mass = 150;

  PVector m_pos;
  PVector m_vel;
  PVector m_acc;

  Shape shape;

  Boid(color col)
  {
    m_pos = new PVector(random(width*0.8), random(height*0.8));
    //m_pos = new PVector(width/2,height/2);
    m_vel = PVector.random2D();
    m_vel.mult(random(2, 7));
    m_acc = new PVector(0, 0, 0);
    shape = new Shape(col);
  }

  void show()
  {
    shape.show(m_pos, m_vel);
    //noFill();
    //circle(m_pos.x, m_pos.y, perception_o);
  }

  void update()
  {
    m_vel.limit(maxSpeed);
    m_pos.add(m_vel);

    m_vel.add(m_acc.div(mass));
  }

  void flock(Boid[] boids, Wall[] walls)
  {
    m_acc.set(0, 0, 0);
    m_acc.add(align(boids));
    m_acc.add(cohesion(boids));
    m_acc.add(separation(boids));
    m_acc.add(obstacles(walls));
  }


  PVector obstacles(Wall[] walls)
  {
    PVector steering = new PVector(0, 0, 0);
    int total = 0;

    for (Wall wall : walls)
    {
      PVector distance = wall.calculateDistance(m_pos);
       if (distance.mag() < 3)
       {
         m_pos = new PVector(0,0,0);
       }
      
      if (distance.mag() < perception_o)
      {
        float sqrDistance = pow(distance.mag(), 2); 
        distance.div(sqrDistance);
        steering.sub(distance);
        total++;
      }
    }

    if (total > 0)
    {
      steering.div(total);
      //steering.sub(m_vel);
      //steering.limit(maxForce_s);
      steering.mult(force_o);
      steering.limit(force_o);
      
    }
    
    return steering;
  }

  PVector align(Boid[] boids)
  {
    PVector steering = new PVector(0, 0, 0);
    int total = 0;

    for (Boid other : boids)
    {
      if (other != this && this.m_pos.dist(other.m_pos) < perception_a)
      {
        steering.add(other.m_vel);
        total++;
      }
    }

    if (total > 0)
    {
      steering.div(total);
      steering.setMag(maxSpeed);
      //steering.sub(this.m_vel);
      //steering.limit(maxForce_a);
      steering.mult(force_a);
    }
    return steering;
  }

  PVector cohesion(Boid[] boids)
  {
    PVector steering = new PVector(0, 0, 0);
    int total = 0;

    for (Boid other : boids)
    {
      if (other != this && this.m_pos.dist(other.m_pos) < perception_c)
      {
        steering.add(other.m_pos);
        total++;
      }
    }

    if (total > 0)
    {
      steering.div(total);
      steering.sub(m_pos);
      steering.setMag(maxSpeed);
      //steering.sub(m_vel);
      //steering.limit(maxForce_c);
      steering.mult(force_c);
    }
    return steering;
  }

  PVector separation(Boid[] boids)
  {
    PVector steering = new PVector(0, 0, 0);
    int total = 0;

    for (Boid other : boids)
    {
      if (other != this && m_pos.dist(other.m_pos) < perception_s)
      {
        PVector diff = PVector.sub(m_pos, other.m_pos);
        float sqrDistance = pow(m_pos.dist(other.m_pos), 5); 
        diff.div(sqrDistance);
        steering.add(diff);
        total++;
      }
    }

    if (total > 0)
    {
      steering.div(total);
      steering.setMag(maxSpeed);
      //steering.sub(m_vel);
      //steering.limit(maxForce_s);
      steering.mult(force_s);
    }
    return steering;
  }
};

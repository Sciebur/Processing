class BoidFactory
{
  //color[] colors = {#808080, #FF0000, #800000, #FFFF00, #808000, #00FF00, #008000, #00FFFF, #008080, #0000FF, #000080, #FF00FF, #800080};
  color[] colors = {#FF0000, #00FF00, #0000FF, #FFFF00, #FF00FF, #00FFFF, #800000, #008000, #000080, #808000, #800080, #008080};
  
  BoidFactory()
  {
  }

  Boid[][] create(int[] sizes)
  {
    Boid[][] result = new Boid[sizes.length][];

    for (int f = 0; f < sizes.length; f++)
    {
      Boid[] flock = new Boid[sizes[f]];
      result[f] = flock;

      for (int i = 0; i < flock.length; i++) 
      {
        flock[i] = new Boid(colors[f]);
      }
    }
    
    return result;
  }
};

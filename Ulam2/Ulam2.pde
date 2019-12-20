int x;
int y;
enum Dir {right,left,up,down};
Dir direction;
int len;
boolean twice;
int num;
int prevnum;
int prev2num;

void setup()
{
  size(700,700);
  background(255);
  stroke(255/2);
  //frameRate(3);

  x = width / 2;
  y = height / 2;
  
  direction = Dir.right;
  len = 1;
  twice = false;
  num = 1;
  prevnum = 1;
  prev2num = 1;
}

void draw()
{  
  for (int i = 0; i < len; i++)
  {
    if (isPrime(num))
      stroke(0);
    else
      stroke(255);   
      
      
    point(x,y);
    num = prevnum + prev2num;
    prev2num = prevnum;
    prevnum = num;
    
    print(num);
    print('\n');
    
    switch(direction)
    {
      case right:
        x++;
        break;
      case left:
        x--;
        break;
      case up:
        y--;
        break;
      case down:
        y++;
        break;
    }    
  }
      switch(direction)
      {
      case right:
        direction = Dir.up;
        break;
      case left:
        direction = Dir.down;
        break;
      case up:
        direction = Dir.left;
        break;
      case down:
        direction = Dir.right;
        break;
    }
  
  if (twice)
  {  
    len++;
    twice = false;
  }
  else
    twice = true;
}

boolean isPrime(int n)
{  
  if (n <= 2 || n % 2 == 0)
      return n == 2;
  for (int i = 3; i * i <= n; i += 2)
      if (n % i == 0)
          return false;
  return true;
}


boolean is3(int n)
{  
  if (n % 3 == 0)
    return true;
  else
    return false;
}

boolean is5(int n)
{  
  if (n % 5 == 0)
    return true;
  else
    return false;
}

class Walker
{
  PVector position = new PVector(0, 0);
  PVector speed = new PVector(5, 8);

  void render()
  {
    fill(182, 52, 100);
    noStroke(); 
    
    circle(position.x, position.y, 50);
  }
 
  void walk()
  {
    PVector step = new PVector(random(-5, 5), random(-5, 5));
  
    position.add(step);
    
    position.x = constrain(position.x, Window.left, Window.right);
    position.y = constrain(position.y, Window.bottom, Window.top);
  }

  void moveAndBounce()
  {
    position.add(speed);
    
    if ((position.x > Window.right) || (position.x < Window.left))
    {
      speed.x *= -1;
    }
    
    if ((position.y > Window.top) || (position.y < Window.bottom))
    {
      speed.y *= -1;
    }
  }
}

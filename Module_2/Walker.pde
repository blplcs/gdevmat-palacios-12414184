class Walker
{
  float x, y;
  
  void render ()
  {
    float r = random(255);
    float g = random(255);
    float b = random(255);
    float a = random(50, 100);
    
    fill(r, g, b, a);
    noStroke(); 
    
    circle (x, y, 25);
  }
  void randomWalk() {
   
    int rng = int(random(4));
    if (rng == 0)
    {
      y+=10;
    }
    else if (rng == 1)
    {
      y-=10;
    }
    else if (rng == 2)
    {
      x+=10;
    }
    else if (rng == 3)
    {
      x-=10;
    }
    keepInBounds();
  }
  
   void randomWalkBiased() {
    float r = random(1);
    
    if (r < 0.4) {          // 40% chance to go right
      x+=10;
    } else if (r < 0.6) {   // 20% chance to go left
      x-=10;
    } else if (r < 0.8) {   // 20% chance to go up
      y-=10;
    } else {                // 20% chance to go down
      y+=10;
    }
    
    keepInBounds();
  }
  void keepInBounds() {
    x = constrain(x, 0, width);
    y = constrain(y, 0, height);
  }

}

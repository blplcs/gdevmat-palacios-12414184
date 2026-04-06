class Walker
{
  float x, y;
  float tx = 0, ty = 10;
  float tSize = 200;
  float tR = 300, tG = 400, tB = 500;
  
  void render ()
  {
  
    float thickness = map(noise(tSize), 0, 1, 5, 150);
    float r = map(noise(tR), 0, 1, 0, 255);
    float g = map(noise(tG), 0, 1, 0, 255);
    float b = map(noise(tB), 0, 1, 0, 255);
    float a = 255;
    
    fill(r, g, b, a);
    noStroke(); 
    
    circle(x, y, thickness);
    
    tSize += 0.02f;
    tR += 0.02f;
    tG += 0.02f;
    tB += 0.02f;
  }
  
  void perlinWalk()
  {
    x = map(noise(tx), 0, 1, -640, 640);
    y = map(noise(ty), 0, 1, -360, 360);
    
    tx += 0.01f;
    ty += 0.01f;
  }
}

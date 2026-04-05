void setup()
{
  size (1020, 720, P3D);
  camera (0,0, -(height/2.0) / tan (PI*30.0 / 180.0), 0, 0, 0, 0, -1, 0);
  background(255);
}

void draw()
{
  // flush screen after 300 frames
  if (frameCount % 300 == 0) {
    background(255);
  }

  // gaussian distribution
  float xStandardDeviation = 200;
  float xMean = 0;
  float x = (randomGaussian() * xStandardDeviation) + xMean;
  
  // random
  float y = random(-height/2, height/2);
  
  // scale and thicnkess
  float sizeMean = 20;
  float sizeSD = 10;
  float circleSize = (randomGaussian() * sizeSD) + sizeMean;
  
  // rgb
  float r = random(255);
  float g = random(255);
  float b = random(255);
  float a = random(10, 100);
  
  noStroke();
  fill(r, g, b, a);
  
  circle(x, y, circleSize);
}

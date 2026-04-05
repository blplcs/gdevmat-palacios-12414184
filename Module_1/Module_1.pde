float freq = 0.05;
float amp = 50;
float offset = 0; 
float scale = 4;

void setup() {
  size(1280, 720);
}

void draw()
{
  background(100);
  
  translate(width/2, height/2);
  
   drawCartesianPlane();
  
  strokeWeight (4);
  
 // 1. f(x) = x^2 - 15x - 3 (yellow color)
 
  noFill();
  stroke(255, 255, 0); 
  strokeWeight(2);
  beginShape();
  for (float x = -30; x <= 45; x += 1) {
    float y = (x * x) - (15 * x) - 3;
    vertex(x * scale, -y * scale); 
  }
  endShape();

  // 2. f(x) = -5x + 30 (purple color)
  stroke(180, 0, 255); 
  float x1 = -60;
  float x2 = 60;
  float y1 = (-5 * x1) + 30;
  float y2 = (-5 * x2) + 30;
  line(x1 * scale, -y1 * scale, x2 * scale, -y2 * scale);
 
 //3. Sine Wave
  stroke(0, 0, 255, 150);
  beginShape();
 
  for (float x = -250; x <= 250; x++) { 
    float y = sin((x * freq) + offset) * amp;
    vertex(x, y);
  }
  endShape();

  offset -= 0.1;
}

void keyPressed() {
  if (key == 'w') amp += 5;  
  if (key == 's') amp -= 5;   
  if (key == 'd') freq += 0.01;
  if (key == 'a') freq -= 0.01; 

}

void drawCartesianPlane ()
{
  strokeWeight (1);
  fill (0);
  stroke (0);
  line (300, 0, -300, 0);
  line (0, -300, 0, 300);
  
  for (int i = -300; i <= 300; i += 10)
  {
    line (i, -2, i, 2);
    line (-2, i, 2, i);
  }
}

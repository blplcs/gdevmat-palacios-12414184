Liquid ocean;
Walker[] walkers = new Walker[10];

void setup() {
  size(1280, 720, P3D);
  camera(0, 0, Window.eyeZ, 0, 0, 0, 0, -1, 0);
  
  ocean = new Liquid(0, -100, Window.right, Window.bottom, 0.1f);
  
  float spacing = Window.widthPx / 11.0f;

  for (int i = 0; i < walkers.length; i++) {
    walkers[i] = new Walker();
    walkers[i].position = new PVector(Window.left + spacing * (i + 1), Window.top + 100);
    walkers[i].mass = i + 1; 
    walkers[i].scale = walkers[i].mass * 15; 
    walkers[i].r = random(255);
    walkers[i].g = random(255);
    walkers[i].b = random(255);
    walkers[i].a = 100;
  }
}

void draw() {
  background(255);
  ocean.render();
  
  PVector wind = new PVector(0.1, 0);

  for (Walker w : walkers) 
  {
    PVector gravity = new PVector(0, -0.15f * w.mass);
    
    w.applyForce(wind);
    w.applyForce(gravity);
    
    if (ocean.isCollidingWith(w)) 
    {
      w.applyForce(ocean.calculateDragForce(w));
    } 
    w.update();
    w.checkEdges(); 
    w.render();
  }
}

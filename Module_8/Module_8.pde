Walker[] walkers = new Walker[10];

PVector wind = new PVector(0.15, 0);
PVector gravity = new PVector(0, -0.4);

void setup()
{
  size(1280, 720, P3D);
  camera(0, 0, Window.eyeZ, 0, 0, 0, 0, -1, 0);

  for (int i = 0; i < walkers.length; i++) {
    walkers[i] = new Walker();
    walkers[i].mass = random(1, 10);
    walkers[i].scale = walkers[i].mass * 15;
    walkers[i].position.set(-500, 200);
  }
}

void draw()
{
    background(80);
    
    for (int i = 0; i < walkers.length; i++) {
      
      walkers[i].applyForce(wind);
      walkers[i].applyForce(gravity);
      walkers[i].update();
      walkers[i].render();
      
      bounce(walkers[i]);
    }
}

void bounce(Walker w) {
 
  if (w.position.x > Window.right) {
    w.position.x = Window.right;
    w.velocity.x *= -1;
  } else if (w.position.x < Window.left) {
    w.position.x = Window.left;
    w.velocity.x *= -1;
  }
  
  if (w.position.y > Window.top) {
    w.position.y = Window.top;
    w.velocity.y *= -1;
  } else if (w.position.y < Window.bottom) {
    w.position.y = Window.bottom;
    w.velocity.y *= -1;
  }
}

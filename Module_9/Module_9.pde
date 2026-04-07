Walker[] walkers = new Walker[8];
PVector wind = new PVector(0.2, 0);

void setup() {
  size(1280, 720, P3D);
  camera(0, 0, Window.eyeZ, 0, 0, 0, 0, -1, 0);
  initializeWalkers();
}

void initializeWalkers() {
  int n = 8;
  for (int i = 0; i < n; i++) {
    walkers[i] = new Walker();

    float posY = 2 * (Window.windowHeight / (float)n) * ((n / 2.0f) - i - 0.5f);
    walkers[i].position = new PVector(Window.left + 100, posY);
    walkers[i].mass = 2 + (i * 1.5); 
    walkers[i].scale = walkers[i].mass * 10; 
    walkers[i].r = random(255);
    walkers[i].g = random(255);
    walkers[i].b = random(255);
    walkers[i].a = 200;
}

}

void draw() {
  background(255);
  
  stroke(0);
  strokeWeight(2);
  line(0, Window.top, 0, Window.bottom);
  noStroke();

  for (Walker w : walkers) {

    float mew = (w.position.x > 0) ? 0.4f : 0.01f;    
    float normal = 1;
    float frictionMagnitude = mew * normal;
    PVector friction = w.velocity.copy();
    friction.mult(-1);
    friction.normalize();
    friction.mult(frictionMagnitude);

    w.applyForce(friction);
    w.applyForce(wind);
    
    w.update();
    w.render();

    if (w.position.x >= Window.right - (w.scale/2)) {
      w.position.x = Window.right - (w.scale/2);
      w.velocity.mult(0);
    }
  }
}

void mousePressed() {
  initializeWalkers();
}

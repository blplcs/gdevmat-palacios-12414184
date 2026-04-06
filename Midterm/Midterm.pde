Matter[] matters = new Matter[150]; 
BlackHole bh;
int resetFrames = 90; 
void setup() {
  size(1080, 720, P3D);
  camera(0, 0, Window.eyeZ, 0, 0, 0, 0, -1, 0);
  
  bh = new BlackHole();
  spawnMatter();
}

void spawnMatter() {
  for (int i = 0; i < matters.length; i++) {
    matters[i] = new Matter();
  }
}

void draw() {
  background(15); 

  if (frameCount % resetFrames == 0) {
    spawnMatter();
  }

  bh.update();

  for (int i = 0; i < matters.length; i++) {
    matters[i].update(bh.position);
    matters[i].render();
  }

  bh.render();
  

  }

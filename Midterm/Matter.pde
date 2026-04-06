class Matter {
  PVector position;
  float size;
  float r, g, b, a;
  float speedFactor;
  boolean absorbed = false;

  Matter() {
   
    position = new PVector(randomGaussian() * 400, randomGaussian() * 300);

    size = random(10, 25);
    r = random(255);
    g = random(255);
    b = random(255);
    a = random(40, 90); 
 
    speedFactor = random(0.05, 0.10); 
  }

  void update(PVector target) {
    if (!absorbed) {
    
      PVector direction = PVector.sub(target, position);

      if (direction.mag() < 12) {
        absorbed = true;
      }

      direction.mult(speedFactor);
      position.add(direction);
    }
  }

  void render() {
  if (!absorbed) {
    fill(r, g, b, a);
    noStroke();

    circle(position.x, position.y, size);
  }
  }
}

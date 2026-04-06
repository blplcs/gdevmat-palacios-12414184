class BlackHole {
  PVector position;
  float scale = 50;

  BlackHole() {
    position = new PVector(0, 0);
  }

  void update() {
    position.x = mouseX - Window.windowWidth;
    position.y = -(mouseY - Window.windowHeight);
  }

  void render() {
  fill(255); 
  noStroke();

  circle(position.x, position.y, scale);
  }
}

public class Walker
{
  public PVector position = new PVector();
  public PVector velocity = new PVector();
  public PVector acceleration = new PVector();
  
  public float velocityLimit = 20;
  public float scale = 15;
  public float mass = 1;
  
  float r, g, b;
  
  public Walker()
  {
    this.r = random(255);
    this.g = random(255);
    this.b = random(255);
  }
  
  public void applyForce(PVector force)
  {
    PVector f = PVector.div(force, this.mass);
    this.acceleration.add(f);
  }
  
  public void update()
  {
    this.velocity.add(this.acceleration);
    this.velocity.limit(velocityLimit);
    this.position.add(this.velocity);
    this.acceleration.mult(0);
  }
  
  public void render()
  {
    fill(r, g, b, 150); 
    stroke(0);
    strokeWeight(0);
    
    circle(position.x, position.y, this.scale); 
  }
}

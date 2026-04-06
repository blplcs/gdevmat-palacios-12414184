public class Walker
{
  public PVector position = new PVector();
  public PVector velocity = new PVector();
  public PVector acceleration = new PVector();
  
  public float velocityLimit = 10;
  public float scale;
  
  public Walker()
  {
    this.position.x = random(Window.left, Window.right);
    this.position.y = random(Window.bottom, Window.top);
    
    this.scale = random(10, 25); 
  }
  
  public void update(PVector target)
  {

    PVector direction = PVector.sub(target, this.position);
    
    direction.normalize();

    this.acceleration = direction;
    this.acceleration.mult(0.2);
    this.velocity.add(this.acceleration);
    this.velocity.limit(velocityLimit);
    this.position.add(this.velocity);
  }
  
  public void render()
  {
  
    fill(180); 
    stroke(0);
    circle(position.x, position.y, this.scale); 
  }
  
 
}

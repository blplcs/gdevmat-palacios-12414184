void setup()
{
  size (1080, 720, P3D);  
  camera (0,0, Window.eyeZ, 0, 0, 0, 0, -1, 0);
}

PVector mousePos()
{
 float x = mouseX - Window.windowWidth;
 float y = -(mouseY - Window.windowHeight);
 return new PVector(x,y);
}

void draw()
{
    background(130);
    
    PVector mouse = mousePos();
    mouse.normalize().mult(450); 
    
    strokeWeight(25);
    stroke(255, 0, 0); 
    line(-mouse.x, -mouse.y, mouse.x, mouse.y); 
    
    strokeWeight(8);
    stroke(255); 
    line(-mouse.x, -mouse.y, mouse.x, mouse.y);
  
    strokeWeight(15);
    stroke(0); 
   
    PVector handle = mouse.copy().normalize().mult(50);
    line(-handle.x, -handle.y, handle.x, handle.y);
    
    println(mouse.mag());
}

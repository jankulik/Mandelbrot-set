int iterations = 100;
float scale = 1;
float my = 0;
float mx = 0;
boolean render = true;

void setup() 
{
  size(800, 800);
}

void draw() 
{   
  background(0);
  loadPixels();
  
  for (int x = 0; x < width; x++) 
  {
    for (int y = 0; y < height; y++) 
    {
      float a = map(x, 0, width, -2.25 * scale + my, 0.75 * scale + my);
      float b = map(y, 0, height, -1.5 * scale + mx, 1.5 * scale + mx);
      
      float constA = a;
      float constB = b;
      
      int n = 0;
      for(n = 0; n < iterations; n++)
      {
        float a2 = a * a - b * b;
        float b2 = 2.0 * a * b;

        a = a2 + constA;
        b = b2 + constB;

        if (a*a + b*b > 16.0) 
        {
          break;
        }
      }

      if(render) pixels[y + x * width] = color(int(map(n,0,45,0,255)));
    }
  }
  
  println(scale);
  render = true;
  updatePixels();
}

void mouseWheel(MouseEvent event)
{
  scale -= (event.getCount() / (50.0 / scale));
  render = false;
}

void keyPressed()
{
  switch(keyCode)
  {
    case 37: mx -= 0.2 * scale; break;
    case 38: my -= 0.2 * scale; break;
    case 39: mx += 0.2 * scale; break;
    case 40: my += 0.2 * scale; break;
  }
  render = false;
}

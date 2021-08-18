void setup()
{
  size (800, 800);
  background(0);
  frameRate(30);
}

void draw()
{
  fill(255, 80);
  triangle(0, height/8, width, height/8, mouseX, mouseY);
}

void mouseClicked()
{
  background(0);
}

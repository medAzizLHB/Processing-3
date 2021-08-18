ArrayList<PVector> pVectors;
ArrayList<Float> speed;
ArrayList<Float> noise;

float i = 255;
float j = 0;

int n = 1;
int life = 6;
int lifeX = 0;
int lifeY = 27;
int score = 0;

boolean isGameStarted=false;
boolean isAlive=false;
boolean isGameEnded=false;
float tr = 5;
float mr = 12;
int initial = 1;
float cx,cy,cr=100;

void setup()
{
  size(800,500);
  pVectors = new ArrayList<PVector>();
  speed = new ArrayList<Float>();
  noise = new ArrayList<Float>();
  n=0;
  for (int a = 1; a <= initial; a++)
  {
    addBullet();
  }
}

void addBullet()
{
  speed.add(random(1,2));
  int rand = int(random(4))%4;
  
  if(rand == 0)
  {
    pVectors.add(new PVector(random(width),0));
  }
  else if(rand == 1)
  {
    pVectors.add(new PVector(random(width),height));
  }
  else if(rand == 2)
  {
    pVectors.add(new PVector(0,random(height)));
  }
  else if(rand == 3)
  {
    pVectors.add(new PVector(width,random(height)));
  }
  noise.add(random(-PI/3,PI/3));
  n++;
}

float q=0;
boolean qIncreasing = false;
boolean qDecreasing = false;

void draw()
{
 if(!isGameStarted && !isGameEnded)
  {
    if(j%2 == 0) {
      i = i - 3;
    } else {
      i = i + 3;
    }
    
    if(i <= 0) {
      j++;
    } else if (i >= 255) {
      j++;
    }
    background(255);
    noStroke();

    cx = width/2;
    cy = height/2+20;
    fill(100,200,i);
    if(sqrt(sq(cx-mouseX)+sq(cy-mouseY))<cr) {
      qIncreasing = true;
      qDecreasing = false;
    } else {
      qIncreasing = false;
      qDecreasing = true;
    }
    
    
    int sizeChangeFrames = 10;
    float sizeup = 40.0/sizeChangeFrames;
    
    if(qIncreasing && q < sizeChangeFrames) {
      q++;
    }
    if(qDecreasing && q >0) {
      q--;
    }
    
    
    ellipse(cx,cy,1.5*cr+sizeup*q,1.5*cr+sizeup*q);
    ellipse(cx+130,cy,1.5*(cr-20)-sizeup*q,1.5*(cr-20)-sizeup*q);
    ellipse(cx-130,cy,1.5*(cr-20)-sizeup*q,1.5*(cr-20)-sizeup*q);

    
    fill(255);
    textSize(25);
    textAlign(CENTER);
    text("start",cx,cy+7);
    textSize(50);
    fill(i,100,200);
    text("DODGE DOTS",cx,cy-100);
  
  } 
  else if(isGameStarted)
  {
    movePlayer();
  }
}
void mousePressed()
{
  if(sqrt(sq(cx-mouseX)+sq(cy-mouseY))<cr) {
     isGameStarted = true;
  }
  if (life<=0)
  {
    isGameStarted = true;
    n = 0;
    life = 5;
    score = 0;
  }
}

void movePlayer()
{
  noStroke();
  if (isAlive)
  {
    background(100,200,i);
  }
  else
  {
    life--;
    background(180,0,80);
    setup();
  }
  
  if (life <= 0)
  {
    textAlign(LEFT);
    background(250,27,0); 
    textSize(50);
    text("GAME OVER",width/2-170,height/2);
    textSize(25);
    text("click to restart",width/2-95,height/2+50);
  }
  for (int x = 1; x <= life; ++x)
  {
    fill(250,50,0);
    ellipse(lifeX + 25*x,lifeY,25,25);
    fill(255);
  }
  if (frameCount % 2 == 0)
  {
    if (life > 0)
    {
      score++;
    }
    
  }
  textSize(27);
  text(score,700,50);
    
  if(frameCount % 27 == 0)
  {
    addBullet();
  }
  
  if(j%2 == 0) {
    i = i - speed.get(0)/2;
  } else {
    i = i + speed.get(0)/2;
  }
  
  if(i <= 0) {
    j++;
  } else if (i >= 255) {
    j++;
  }
  ellipse(mouseX,mouseY,2*mr,2*mr);
  
  isAlive = true;
  for (int a = 0; a < n; a++)
  {
    fill(27);
    ellipse(pVectors.get(a).x,pVectors.get(a).y,2*tr,2*tr);
    if (isAlive)
    {
      fill(255);
    } else {
      fill(27);
    }
    PVector mouse = new PVector(mouseX,mouseY);
    mouse.sub(pVectors.get(a));
  
   
    isAlive = isAlive && (mouse.mag()-speed.get(a)>mr+tr);
    mouse.rotate(noise.get(a));
    
    if(mouse.mag()>speed.get(a))
    {
      mouse.normalize();
      mouse.mult(speed.get(a));
    }
    pVectors.get(a).add(mouse);
  }
}

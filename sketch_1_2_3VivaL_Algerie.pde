float x = 300;
float y = 300;
PImage img;
 
void setup() {
  background(135);
  fullScreen();
  //size(400, 400);
  //rectMode(CENTER);
  noStroke();
   fill(0,255,0);
  rect(200,100, width/2-200, 500);
  fill(255);
  rect(683,100, width-883, 500);
 
  translate(width/2+50, height/2);
  fill(255,0 ,0);
  stroke(255,0,0);
  strokeWeight(2);
  beginShape();
  vertex(0, -50);
  vertex(14, -20);
  vertex(47, -15);
  vertex(23, 7);
  vertex(29, 40);
  vertex(0, 25);
  vertex(-29, 40);
  vertex(-23, 7);
  vertex(-47, -15);
  vertex(-14, -20);
  endShape(CLOSE);
  
  translate(-300, -200);
    beginShape();
vertex(288.0, 149.0);
bezierVertex(288.0, 149.0, 288.0, 149.0, 288.0, 149.0);
bezierVertex(288.0, 149.0, 215.0, 114.0, 197.0, 171.0);
bezierVertex(179.0, 228.0, 245.0, 254.0, 245.0, 254.0);
bezierVertex(245.0, 254.0, 208.0, 207.0, 231.0, 176.0);
bezierVertex(254.0, 145.0, 288.0, 152.0, 288.0, 152.0);
endShape();
  img = get();
}
 
void draw(){
  background(135);
  //image(img, 0,0);
  for(int x = 0; x < width; x++){
    image(img.get(x,0,1,img.height), x, 20*sin(radians(x+millis())));
  }
}

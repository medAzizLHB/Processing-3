void setup() {
  size(720, 720);
  //fullScreen();
  background(-1);
  fill(-1);
  stroke(0);
}

void draw() {
  translate(width/2, height/2);
  float size=1;
  for (int i=0; i<256; i++) {
    size*=1.02;
    int dept=i-frameCount;
    float k=size*width/3;
    for (float j=0; j<1; j+=.125) {
      float noise_index=dept*.01+j;
      rect((noise(noise_index, 0)-.5)*k,
             (noise(noise_index, 1)-.5)*k, size,size);
    }
  }
};

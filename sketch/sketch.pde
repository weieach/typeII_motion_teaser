import processing.sound.*;
SoundFile bgm;

PImage fromImg;
PImage toImg;

int w = 1080;
int h = 1920;
int previewW = w/2;
int previewH = h/2;
color bgcolor = #212425;
int factor = 1;
int s;
int f;
int frameRate = 24;



void setup() {
  size(540, 960);
  fromImg = loadImage("from-nanoscale.png");
  toImg = loadImage("to-macroscale.png");
  //bgm = new SoundFile(this, "data/ThePointsThatMatter.mp3");
  //bgm.play();
  pixelDensity(2);
  frameRate(frameRate);
  toImg.resize(width,0);
}

void draw() {
  background(bgcolor);
  int tileW = width / factor;
  int tileH = height / factor;
  s = floor(frameCount / frameRate);
  f = frameCount % frameRate;

  if (s >= 1 && f >= 5) {
    if (s == 1 && f==17 || s == 2 && f== 4 || s == 2 && f == 12) {
      factor += 10;
    }
    for (int y = 0; y < factor; y++) {
      for (int x = 0; x < factor; x++) {
        fromImg.resize(tileW, 0);
        image(fromImg, x*tileW, y*tileH);
      }
    }
    if(s >= 2 && f >= 12){
      pushMatrix();
      translate(0, height - toImg.height);
      image(toImg, 0, 0);
      popMatrix();
    }
  }


  // if (frameCount % 5 == 0) {
  //   factor++;
  // }
}


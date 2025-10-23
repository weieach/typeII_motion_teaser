PImage fromImg;
int w = 1080;
int h = 1920;
int previewW = w/2;
int previewH = h/2;
color bgcolor = #212425;
int factor = 1;

void setup() {
  size(540, 960);
  fromImg = loadImage("from-nanoscale.png");

  pixelDensity(2);
  frameRate(24);
}

void draw() {
  background(bgcolor);
  int tileW = width / factor;
  int tileH = height / factor;
  for (int y = 0; y < factor; y++) {
    for (int x = 0; x < factor; x++) {
      fromImg.resize(tileW, 0);
      image(fromImg, x*tileW, y*tileH);
    }
  }

  if (frameCount % 5 == 0) {
    factor++;
  }
}

import processing.sound.*;

SoundFile bgm;

PImage fromImg;
PImage toImg;
PImage designImg;
PImage textA;
PImage textRevolution;
PImage[] disciplineArr = new PImage[7]; 
PGraphics nanoArray;

PFont geistMono;
PFont geist;

int w = 1080;
int h = 1920;
int previewW = w/2;
int previewH = h/2;

int lastFactor = -1;
int s;
int f;
int frameRate = 24;

int designImgNum = 1;
int disciplineImgNum = 0;
int factorX = 1;
int factorY = 1;

color bgcolor = #222425;
color fYellow = #CFE830;



void setup() {
  size(540, 960, P2D);
  fromImg = loadImage("from-nanoscale.png");
  toImg = loadImage("to-macroscale.png");
  designImg = loadImage("design.png");

  int scalableFontSize = int(width / 50);

  textA = loadImage("a.png");
  textRevolution = loadImage("Revolution.png");

  geistMono = createFont("GeistMono-VariableFont_wght.ttf", 44);
  geist = createFont("Geist-VariableFont_wght.ttf", scalableFontSize);
  textFont(geistMono);

  bgm = new SoundFile(this, "data/ThePointsThatMatter.mp3");
  bgm.play();
  pixelDensity(2);
  frameRate(frameRate);
  toImg.resize(width, 0);

  ellipseMode(CENTER);
  //designImg.resize(int(width*0.84), 0);
  designImg.resize(0, int(height*0.102));

  textA.resize(int(width * 0.07), 0);
  textRevolution.resize(0, int(height*0.059));

  for(int i = 0; i < 7; i++){
    int imageNum = i + 1;
    disciplineArr[i] = loadImage("data/discipline-array/" + imageNum + ".png");
    disciplineArr[i].resize(0, int(height*0.105));
  }
}

void draw() {
  background(bgcolor);
  textFont(geistMono);

  s = floor(frameCount / frameRate);
  f = frameCount % frameRate;


  // Part 1: From nano...to Macro
  int tileW = width / factorX;
  int tileH = height / factorY;

  if(frameCount < sfCompute(1, 5)){
    for (int y = 0; y < factorY; y++) {
      for (int x = 0; x < factorX; x++) {
        fromImg.resize(tileW, 0);
        // ellipse(x*tileW, y*tileH, tileW, tileH);
        image(fromImg, x*tileW, y*tileH);
      }
    }
  }

  if (frameCount >= sfCompute(1, 5) && frameCount <= sfCompute(3, 14)) {
    pushMatrix();
    if (frameCount == sfCompute(1, 5)) {
      factorX += 1;
      factorY += 2;
    }
    if (frameCount == sfCompute(1, 17) || frameCount == sfCompute(2, 4) || frameCount == sfCompute(2, 12)) {
      factorX *= 2;
      factorY *= 3;
    }
    for (int y = 0; y < factorY; y++) {
      for (int x = 0; x < factorX; x++) {
        fromImg.resize(tileW, 0);
        // ellipse(x*tileW, y*tileH, tileW, tileH);
        image(fromImg, x*tileW, y*tileH);
      }
    }
    if (frameCount >= sfCompute(2, 12)) {
      pushMatrix();
      translate(0, height - toImg.height);
      image(toImg, 0, 0);
      popMatrix();
    }
    popMatrix();
  }

  //Part 2: Design array
  //Original end: sfCompute(5, 22) -> + 32f
  if (frameCount > sfCompute(3, 14) && frameCount <= sfCompute(7, 6)) {
    imageMode(CENTER);
    rectMode(CENTER);
    pt2DesignArray();
  }

  
  //Part 3
  color inverseBG = #DFDBDA;
  color fg = #222425;
  if(frameCount > sfCompute(7, 6)){
    pt3TwirlingNames(inverseBG, fg);
  }

  //Annotation
  text(s + "s" + f + "f", 0, height-100);
}

import processing.sound.*;

SoundFile bgm;

PImage fromImg;
PImage toImg;
PImage designImg;
PImage textA;
PImage textRevolution;
PImage creativeImg;
PImage title400;
PImage finalScene;

String[] artists;
String[] exhibitNames;
int exhibitIndex = 0;

// PImage maskImg;
PImage[] disciplineArr = new PImage[7];
PImage[] exhibitArr = new PImage[30];
PImage[] cellularAutoSeq = new PImage[25];
PImage[] exhibitCapsules = new PImage[30];
int indexCA = 0;
int titleCounter = 0;

// PGraphics masked;
PGraphics mask;
PGraphics noMask;
int maskW;
int maskH;

PFont geistMono;
PFont geist;
PFont geistMonoSmall;
PFont geistSmall;

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
// color bgcolor = #222425;
color fYellow = #CFE830;
color inverseBG = #DFDBDA;


void setup() {
  size(540, 960, P2D);
  pixelDensity(2);

  maskW = int(width * 0.17 + 1);
  maskH = int(height * 0.0925);

  fromImg = loadImage("from-nanoscale.png");
  toImg = loadImage("to-macroscale.png");
  designImg = loadImage("design2.png");
  creativeImg = loadImage("creative.png");
  // maskImg = loadImage("mask.png");
  title400 = loadImage("400+.png");
  finalScene = loadImage("finalScene.png");
  finalScene.resize(int(width * 0.856), 0);

  mask = createGraphics(width, height);
  noMask = createGraphics(width, height);
  // mask = createGraphics(int(width * 0.17), int(height * 0.0925));
  // mask.noStroke();

  // maskImg.resize(width,0);

  int scalableFontSize = int(width / 50);

  textA = loadImage("a.png");
  textRevolution = loadImage("Revolution.png");

  geistMono = createFont("GeistMono-VariableFont_wght.ttf", scalableFontSize * 4.07);
  geistMonoSmall = createFont("GeistMono-VariableFont_wght.ttf", width * 0.022);
  geist = createFont("Geist-VariableFont_wght.ttf", scalableFontSize);
  geistSmall = createFont("Geist-VariableFont_wght.ttf", width * 0.02);
  textFont(geistMono);

  bgm = new SoundFile(this, "data/ThePointsThatMatter.mp3");
  bgm.play();

  frameRate(frameRate);
  toImg.resize(width, 0);
  title400.resize(int(width*0.5), 0);

  ellipseMode(CENTER);
  //designImg.resize(int(width*0.84), 0);
  designImg.resize(0, int(height*0.102));
  creativeImg.resize(0, int(height*0.105));

  textA.resize(int(width * 0.07), 0);
  textRevolution.resize(0, int(height*0.059));

  for (int i = 0; i < 7; i++) {
    int imageNum = i + 1;
    disciplineArr[i] = loadImage("data/discipline-array/" + imageNum + ".png");
    disciplineArr[i].resize(0, int(height*0.105));
  }

  for (int i = 0; i < exhibitArr.length; i++) {
    int imageNum = i + 1;
    exhibitArr[i] = loadImage("data/exhibits-images/" + imageNum + ".png");

    exhibitCapsules[i] = loadImage("data/exhibit-BWcapsule/" + imageNum + ".png");
    exhibitCapsules[i].resize(int(width * 0.554), 0);
  }

  for (int i = 0; i < cellularAutoSeq.length; i++) {
    int imageNum = i + 1;
    cellularAutoSeq[i] = loadImage("data/cellular-automata-sequence/" + imageNum + ".png");
    cellularAutoSeq[i].resize(int(width * 0.856), 0);
  }

  artists = loadStrings("artist_names.txt");
  exhibitNames = loadStrings("exhibit-names.txt");
}

void draw() {
  background(bgcolor);
  textFont(geistMono);

  s = floor(frameCount / frameRate);
  f = frameCount % frameRate;


  // Part 1: From nano...to Macro
  int tileW = width / factorX;
  int tileH = height / factorY;

  if (frameCount < sfCompute(1, 5)) {
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
      factorY *= 2;
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
  if (frameCount > sfCompute(3, 14) && frameCount <= sfCompute(7, 8)) {
    imageMode(CENTER);
    rectMode(CENTER);
    pt2DesignArray();
  }


  //Part 3: twirling names


  if (frameCount > sfCompute(7, 8) && frameCount <= sfCompute(10, 9)) {
    pt3TwirlingNames();
    //old end: 11s7f
  }

  //Part 4: enumerator
  if (frameCount > sfCompute(10, 9) && frameCount <= sfCompute(14, 14)) {
    background(inverseBG);
    pt4Enumerator();
  }

  //Part 5: end
  if (frameCount > sfCompute(14, 14) && frameCount <= sfCompute(15, 18)) {
    background(bgcolor);
    pushMatrix();
    imageMode(CENTER);
    translate(width * 0.046, 0.034*height);
    image(finalScene, width/ 1.97, 0.45* height);
    String date = "Feb. 12 / May. 12, 2008 ";
    textFont(geistMono);
    textSize(width * 0.025);
    fill(200);
    for (int i = 0; i < titleCounter; i++) {
      pushMatrix();
      if (i != 0) {
        translate(0, 0.018 * height * i);
      }
      text(date.charAt(i), 0, 0.005 * height + 0.018 * height * 13.5);
      popMatrix();
    }
    popMatrix();
  }



  // if (frameCount > sfCompute(8, 17) && frameCount <= sfCompute(10, 3)) {
  //   pt4ArtistNames();
  // }

  //Annotation
  // text(s + "s" + f + "f", 0, height-100);
}

void keyPressed() {
  saveFrame();
}


int sfCompute(int s, int f) {
  int sf = s * 24 + f;
  return sf;
}

PGraphics drawMasked(int secondsBackward, int artistIndex, boolean varyingLength) {
    PGraphics masked = createGraphics(width,height);
  int tiles = int(height / 4);
  int step = 360 / tiles;
  color fg = #000000;


  masked.beginDraw();
  // masked.textFont(geist);
  masked.background(inverseBG);
  masked.fill(fg);
  masked.pushMatrix();
  masked.translate(width/2, disciplineArr[3].height * 3 + height*0.173);
  masked.noStroke();
  //masked.strokeWeight(20);

  //buffer and stuff
  //   drawmasked(tiles, step, fg);

  
    for (int i = 0; i < tiles; i++) {
      // fill(#FA5151);
      // textSize(40);
      // text(i* step * frameCount * 0.1, 0, 0);
      masked.pushMatrix();
      
      masked.rotate(radians(i* step * (frameCount - secondsBackward) * 0.1 + 2));

      masked.translate(i*3, 0);
    
      masked.text(artists[artistIndex], 35, 35);
      if(artistIndex == 300){

      }
      else if(artistIndex + 1 < 299){
        artistIndex++;
      } else {
        artistIndex = 0;
      }

      if(varyingLength){
        if(random(1) > 0.5){
        masked.rect(0, 0, textWidth(artists[artistIndex]), 35);
      } else {
         masked.rect(0, 0, textWidth("designer"), 35);
      }
      } else {
        masked.rect(0, 0, 35, 35);
      }
      
      
      

      masked.popMatrix();
    }
  

  masked.popMatrix();
  masked.endDraw();
  return masked;
}


void drawMask() {
  mask.beginDraw();
  mask.pushMatrix();
  mask.rectMode(CENTER);
  mask.background(0);
  mask.fill(255);
  mask.rect(width/2 - width * 0.02, height/2 - height * 0.01, maskW, maskH);
  mask.popMatrix();
  mask.endDraw();
}

void noMask() {
  noMask.beginDraw();
  noMask.pushMatrix();
  noMask.rectMode(CENTER);
  noMask.background(0);
  noMask.fill(255);
  noMask.rect(0, 0, width*2, height*2);
  noMask.popMatrix();
  noMask.endDraw();
}


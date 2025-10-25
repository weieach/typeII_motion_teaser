void pt3TwirlingNames() {
  background(inverseBG);
  textFont(geist);
  int secondsBackward = sfCompute(6, 0);
  boolean varyingLength = false;

  noMask();
  if (frameCount > sfCompute(8, 17)) {
    secondsBackward = -(sfCompute(17, 13) - sfCompute(8, 17));
  }

  if(frameCount < sfCompute(8,6) && frameCount > sfCompute(7,19)){
    varyingLength = true;
  }
  

  if (frameCount > sfCompute(9, 5)) {
    varyingLength = true;
  }
  
  if (frameCount >= sfCompute(9, 16) && frameCount < sfCompute(11, 2)) {
    varyingLength = false;
  }


  int artistIndex = int(random(300));
  PImage masked = drawMasked(secondsBackward, artistIndex, varyingLength);
  PImage noMaskImg = noMask.get();
  PImage maskedImg  = masked.get(); //turn PGraphic into PImage
  maskedImg.mask(noMaskImg);
  imageMode(CENTER);

  //background(#DE307A);

  image(maskedImg, width/2, height/2);

  if (frameCount >= sfCompute(9, 5) && frameCount < sfCompute(11, 2)) {
    image(title400, width/2, height/2);
  }

  //copy(mask, width/2 - maskW / 2, height/2 - maskH/2, maskW, maskH, width/2 - maskW / 2, height/2 - maskH/2, maskW, maskH);

  //copy();
  //"creative"
  if (frameCount < sfCompute(8, 17)) {
    pushMatrix();
    translate(width/2, disciplineArr[3].height * 3 + height*0.173);
    image(creativeImg, 0, 0);
    popMatrix();

    //a
    pushMatrix();
    translate(width/2, height*0.073);
    image(textA, 0, 0);
    popMatrix();

    //revolution
    pushMatrix();
    translate(width/2, height*0.073 + designImg.height * 8.2);
    image(textRevolution, 0, 0);
    popMatrix();
  }
}


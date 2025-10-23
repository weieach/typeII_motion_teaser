void pt2DesignArray() {
  pushMatrix();
  translate(width/2, height*0.073);

  //"a"
  // fill(fYellow);
  // stroke(fYellow);
  // strokeWeight(8);
  // textAlign(CENTER, CENTER);
  // text("a", 0, 0);
  image(textA, 0, 0);

  if (frameCount >= sfCompute(4, 1)) {
    translate(0, height*0.1);
    for (int i = 0; i < designImgNum; i++) {
      pushMatrix();
      translate(0, designImg.height * i);
      image(designImg, 0, 0);
      popMatrix();
    }
    if (frameCount <= sfCompute(5, 12)) {
      if ((frameCount - sfCompute(4, 1)) % 3 == 0 && designImgNum < 7) {
        designImgNum ++;
      }
    }
  }
  popMatrix();
  
  if (frameCount > sfCompute(5, 10)) {
    translate(width/2, height*0.073);
    pushMatrix();
    translate(0, designImg.height * 8.2);
    image(textRevolution, 0, 0);
    // if (frameCount == sfCompute(5, 12)) {
    //   saveFrame();
    // }
    popMatrix();


    if (frameCount >= sfCompute(5, 22)) {
        translate(0, height*0.1);
      for (int i = 0; i < disciplineImgNum; i++) {
        pushMatrix();
        translate(0, disciplineArr[1].height * i);
        image(disciplineArr[i], 0, 0);
        popMatrix();
      }
      if ((frameCount - sfCompute(5, 22)) % 3 == 0 && disciplineImgNum < 7) {
        disciplineImgNum ++;
      }
      if(frameCount == sfCompute(7, 0)){
        saveFrame();
      }
    }

  }
}

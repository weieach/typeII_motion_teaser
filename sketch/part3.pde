void pt3TwirlingNames(color inverseBG, color fg) {


  String str = "design";
  background(inverseBG);
  textFont(geist);

  int tiles = int(height / 4);
  int step = 360 / tiles;
  fill(fg);
  pushMatrix();
  translate(width/2, disciplineArr[3].height * 3 + height*0.173);
  noStroke();
  strokeWeight(20);
  noFill();

  for (int i = 0; i < tiles; i++) {
    fill(fg);

    pushMatrix();
    rotate(radians(i* step * frameCount * 0.1));
    translate(i*3, 0);

    text(str, 35, 35);

    rect(0, 0, textWidth(str), 35);



    popMatrix();
  }
  popMatrix();

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


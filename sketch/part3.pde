void pt3TwirlingNames(color inverseBG, color fg) {
  

  String str = "design";
  background(inverseBG);
  textFont(geist);

  int tiles = int(width / 12);
  int step = 360 / tiles;
  fill(fg);
  pushMatrix();
  translate(width/2, height/2 - disciplineArr[3].height * 3 + height*0.173);
  noStroke();
  strokeWeight(20);
  noFill();

  for (int i = 0; i < tiles; i++) {
    fill(#000000);

    pushMatrix();
    rotate(radians(i*step * frameCount * 0.1));
    translate(i*3, 0);

    text(str, 35, 35);

    rect(0, 0, textWidth(str), 35);



    popMatrix();
  }
  popMatrix();

  pushMatrix();
  translate(width/2, disciplineArr[3].height * 3);
  image(disciplineArr[3], 0, 0);
  popMatrix();
}


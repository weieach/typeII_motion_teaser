void pt4Enumerator() {
  // int listLength = 26;
  float textHeightFactor = 0.018;

  pushMatrix();
  // translate(width * 0.046, 0.034*height);
  translate(width * 0.046, 0.034*height);
  textFont(geistMono);
  textSize(width * 0.022);
  int rectSize = int(width * 0.026);

  if (exhibitIndex < 12) {
    drawFinalTitle();
    for (int i = 0; i < exhibitIndex; i++) {
      if (i == exhibitIndex - 1) {
        drawCapsule(i, 0);
      }

      pushMatrix();
      translate(0, textHeightFactor * height * i);
      String entryNumber = str(i + 1);
      if (i-1 < 10) {
        entryNumber = "0" + entryNumber;
      }

      fill(#6F6E6D);
      if (i == exhibitIndex - 1) {
        fill(0);
        // rectMode(CENTER);
        rect(rectSize/2, -rectSize/3, rectSize, rectSize);
      }

      text(entryNumber, 0, 0);
      text(exhibitNames[i], width * 0.068, 0);
      popMatrix();
    }
    if (frameCount %2 == 0) {
      exhibitIndex++;
    }
  } else {
    pushMatrix();
    for (int i = 0; i < 12; i++) {
      pushMatrix();
      translate(0, textHeightFactor * height * i);
      String entryNumber = str(i + 1);
      if (i-1 < 10) {
        entryNumber = "0" + entryNumber;
      }
      fill(#6F6E6D);
      text(entryNumber, 0, 0);
      text(exhibitNames[i], width * 0.068, 0);
      popMatrix();
    }

    //title iteration

    drawTitleImg();

    pushMatrix();
    translate(0, 0.005 * height + textHeightFactor * height * 13);

    fill(0);

    for (int i = 0; i < titleCounter; i++) {
      if (i != 0) {
        translate(0, textHeightFactor * height);
      }
      text("13", 0, 0);
    }
    if (titleCounter < 24 && frameCount %2 == 0) {
      updateTitleImg();
      titleCounter++;
      print(titleCounter);
    }
    popMatrix();
    //rest of exhibits


    if (titleCounter >= 24) {
      pushMatrix();
      translate(0, height * 0.466);

      for (int i = 13; i < exhibitIndex; i++) {
        if (i == exhibitIndex - 1) {
          drawCapsule(i, -height * 0.466);
        }

        pushMatrix();
        translate(0, textHeightFactor * height * i);
        String entryNumber = str(i + 1);

        fill(#6F6E6D);
        if (i == exhibitIndex - 1) {
          fill(0);
          // rectMode(CENTER);
          rect(rectSize/2, -rectSize/2, rectSize, rectSize);
        }

        text(entryNumber, 0, 0);
        text(exhibitNames[i], width * 0.068, 0);
        popMatrix();
      }
      if (exhibitIndex < exhibitArr.length - 1 && frameCount %2 == 0) {
        exhibitIndex++;
      }
      popMatrix();
    }
    popMatrix();
  }

  popMatrix();
}

void drawCapsule(int i, float heightCorrection) {
  imageMode(CENTER);
  image(exhibitCapsules[i], width/ 1.6, heightCorrection + 0.39 * height);
}



void drawFinalTitle() {
  imageMode(CENTER);
  image(cellularAutoSeq[cellularAutoSeq.length-1], width/ 1.97, 0.45* height);
}

void drawTitleImg() {
  imageMode(CENTER);
  image(cellularAutoSeq[indexCA], width/ 1.97, 0.45* height);
}

void updateTitleImg() {
  if (indexCA < cellularAutoSeq.length - 1) {
    indexCA++;
  }
}

//   if (exhibitIndex < listLength - 1 && frameCount %2 == 0) {
//     exhibitIndex++;
//   }


// else {
//       pushMatrix();
//       translate(0, 0.005 * height + 0.033 * height * 12);
//       if (i <= 36) {
//         drawTitleImg(true);
//         pushMatrix();
//         fill(0);

//         for (int i2 = 0; i2 < exhibitIndex - 12; i++) {
//           translate(0, 0.017 * height * i);
//           text("13", 0, 0);
//         }

//         popMatrix();
//       } else {
//         //just repeating from before
//         drawTitleImg(false);
//         pushMatrix();

//         translate(0, 0.033 * height * i);
//         String entryNumber = str(i);

//         fill(#6F6E6D);
//         if (i == exhibitIndex - 1) {
//           fill(0);
//           // rectMode(CENTER);
//           rect(rectSize/2, -rectSize/2, rectSize, rectSize);
//         }

//         text(entryNumber, 0, 0);
//         text(exhibitNames[i], width * 0.068, 0);
//         popMatrix();
//       }
//       popMatrix();
//     }


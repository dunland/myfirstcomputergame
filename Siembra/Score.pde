class Score { //<>//
  //
  int score, time;//just a random number for now
  PImage scorescreen;
  float textX, textY=100;
  int text2opacity=0;
  boolean text2go=false;

  Score(int score) {
    this.score = score;
    //this.time = 0;
    scorescreen = loadImage("scorescreen.jpg");
  }

  void mousePressed() { 
    println(mouseX, mouseY); //prints mouse position in console, for easier designing
  }

  void draw() {
    /*SCORE SCREEN:
     first the score will slowly appear, after that another text line will show up to
     tell the player what to do. All of this will work only during state GAMEOVER.
     Nice animations of flying birds etc might be added later.
     Variables from game displayed: Score, duration(time), ???*/

    //TODO: warum passiert das???
    image(scorescreen, 0+width/2, 0+height/2, width, height); 
    textSize(24);
    fill(0, (textY-100)/88*255); //makes text completely opaque when Y=188
    //text("SCORE: "+score+"\nDURATION: "+time, textX, textY);
    text("SCORE: " + score, textX, textY);
    textX=100;
    if (textY<=188) { //downwoard text motion
      textY+=10/frameRate;
    } else {
      text2go=true; //activates command for text2 to appear
    }
    if (text2go==true) {
      fill(0, text2opacity); //continuously makes the text get less transparent
      text("press any key to continue...", 420, 550);
      if (text2opacity<=254) {
        text2opacity+=15;
      }
    }
  }
}
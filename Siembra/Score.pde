class Score { //<>//
  //
  int score, time;//just a random number for now
  PImage scorescreen;
  float textX=width*1/5, textY=100;
  int text2opacity=0;
  boolean text2go=false;

  Score(int score) {
    this.score = score;
    //this.time = 0;
    scorescreen = loadImage("scorescreen.png");
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

    imageMode(CORNER);
    image(scorescreen, 0, 0, width, height); 
    textSize(24);
    fill(0, (textY-100)/88*255); //makes text completely opaque when Y=188
    //text("SCORE: "+score+"\nDURATION: "+time, textX, textY);
    text("SCORE: " + score, textX, textY);
    if (textY<=188) { //downwoard text motion
      textY+=10/frameRate;
    } else {
      text2go=true; //activates command for text2 to appear
    }
    if (text2go==true) {
      fill(0, text2opacity); //continuously makes the text get less transparent
      text("press any key to continue...", width*2/3, height*9/10);
      if (text2opacity<=254) {
        text2opacity+=15;
      }
    }
  }
}
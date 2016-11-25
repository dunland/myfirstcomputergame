// //<>// //<>//
int score=123986591, time=634;//just a random number for now
PImage scorescreen;
float textX, textY=100;
int GAMEOVER, GAME; //important for the final code
int gamestate=GAMEOVER;
int text2opacity=0;
boolean text2go=false;

void setup() {
  size(800, 600);
  scorescreen = loadImage("scorescreen.jpg");
}

void mousePressed() { 
  println(mouseX, mouseY); //prints mouse position in console, for easier designing
}

void keyPressed() {
  if (gamestate==GAMEOVER) {
    gamestate=GAME;
    exit(); //only for testing - needs to be removed in the game
  }
}

void draw() {

  /*SCORE SCREEN:
   first the score will slowly appear, after that another text line will show up to
   tell the player what to do. All of this will work only during state GAMEOVER.
   Nice animations of flying birds etc might be added later.
   Variables from game displayed: Score, duration(time), ???*/

  if (gamestate==GAMEOVER) { //this is to add this code to our final one
    image(scorescreen, 0, 0);
    textSize(24);
    fill(0, (textY-100)/88*255); //makes text completely opaque when Y=188
    text("SCORE: "+score+"\nDURATION: "+time, textX, textY);
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
import ddf.minim.*;
import ddf.minim.analysis.*;
import ddf.minim.effects.*;
import ddf.minim.signals.*;
import ddf.minim.spi.*;
import ddf.minim.ugens.*;

Intro intro;
Game game;
Score score;

int START=1, GAME=2, SCORE=3;
int gameState=START;

void setup() {
  //size(800, 600, P3D);
  fullScreen(P3D);
  noSmooth();
  intro = new Intro(new Minim(this));
}

void draw() {
  if (gameState == START) {
    intro.draw();
  }
  if (gameState == GAME) {
    game.draw();
    if (game.gameOver) {
      score = new Score(game.score);
      gameState = SCORE;
    }
  }
  if (gameState == SCORE) {
    score.draw();
  }
}

void keyPressed() {
  if (gameState == START || gameState == SCORE) {
    game = new Game();
    gameState = GAME;
  }
}
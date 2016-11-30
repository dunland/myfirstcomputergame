class Game {

  ////VISUAL POINTS OF THE BOAT
  //int[] xvals;
  //int[] yvals;
  //int[] bvals;

  //Collision
  float boatX, boatY;
  float boat_r = 70; //Radius of boat

  //text and image
  PImage boat;
  int lives=3;

  //Background SEE
  float rectX=0; 
  int speed=2;

  //Visual of the movement
  int[] xvals;
  int[] yvals;
  //int [] bvals;

  //General Game
  boolean gameOver;
  int score;
  int gameTime; // elapsed time since beginning of the game

  int obstacleAmount=15;
  Welle[] wellen = new Welle[15];
  ArrayList<Obstacle> obstacles = new ArrayList<Obstacle>(obstacleAmount);
  //Obstacle[] obstacles = new Obstacle[obstacleAmount];

  Game() {
    background(#C6F3F5);

    wellen[0] = new Welle(0, #A3CBE3, 250);
    wellen[1] = new Welle(200, #328ABF, 250);
    wellen[2] = new Welle(400, #1999E5, 200);

    wellen[3] = new Welle(0, #206198, 50);
    wellen[4] = new Welle(50, #538DBF, 50);
    wellen[5] = new Welle(100, #7EC4FF, 50);
    wellen[6] = new Welle(150, #9DCEF7, 50);
    wellen[7] = new Welle(200, #206198, 50);
    wellen[8] = new Welle(250, #9DCEF7, 50);
    wellen[9] = new Welle (300, #7EC4FF, 50);
    wellen[10] = new Welle(350, #538DBF, 50);
    wellen[11] = new Welle(400, #206198, 50);
    wellen[12] = new Welle (450, #9DCEF7, 50);
    wellen[13] = new Welle (500, #538DBF, 50);
    wellen[14] = new Welle (550, #206198, 50);

    //initial obstacle creation
    for (int i=0; i<obstacles.size(); i++) {
      obstacles.add(new Obstacle());
    }

    ellipseMode(CENTER);
    println(lives);

    boat =loadImage("boat.png");

    xvals=new int[width];
    yvals=new int[height];
    //bvals =new int [height];
  }


  //OBSTACLES-BOAT-MONSTER
  void draw() {
    if (lives<=0) {
      gameOver = true;
    }


    //BACKGROUND AND WAVES
    noStroke();
    background(#C6F3F5);

    for (Welle welle : wellen) {
      welle.draw();
    }


    //OBSTACLE MOTION
    for (int i = 0; i<obstacles.size(); i++) {
      obstacles.get(i).move();
      obstacles.get(i).display();
    }

    /*OBSTACLE-BOAT-INTERACTION:
     vertical and horizontal distances are checked to be within obstacle radius.
     When both dimensions are reached, one life is lost.
     Check proximity*/
    for (int i=0; i<obstacles.size(); i++) {
      if (boatX+boat_r/4 >= obstacles.get(i).xPos-obstacles.get(i).o_rad && boatX-boat_r/4 <= obstacles.get(i).xPos+obstacles.get(i).o_rad) {
        if (boatY+boat_r/4 >= obstacles.get(i).yPos-obstacles.get(i).o_rad && boatY-boat_r/4 <= obstacles.get(i).yPos+obstacles.get(i).o_rad) {
          lives-=1;
          obstacles.get(i).yPos=0-obstacles.get(i).o_rad;
          obstacles.get(i).xPos = random(0, width-10);
          obstacles.get(i).o_rad = random(0, 50);
          obstacles.get(i).o_speed = random(0.5, 5);
        }
      }
      if (boatY+boat_r/4 >= obstacles.get(i).yPos-obstacles.get(i).o_rad && boatY-boat_r/4 <= obstacles.get(i).yPos+obstacles.get(i).o_rad) {
        if (boatX+boat_r/4 >= obstacles.get(i).xPos-obstacles.get(i).o_rad && boatX-boat_r/4 <= obstacles.get(i).xPos+obstacles.get(i).o_rad) {
          lives-=1;
          obstacles.get(i).yPos=0-obstacles.get(i).o_rad; //resets the obstacle position
          obstacles.get(i).xPos = random(0, width-10);
          obstacles.get(i).o_rad = random(0, 50);
          obstacles.get(i).o_speed = random(0.5, 5);
        }
      }
    }
    
    //OBSTACLE-CREATION:
    //will add a new obstacle every 30 secons
    //(see below how gameTime constantly increases)
    if(gameTime % 30 == 0){
      obstacles.add(new Obstacle());
    }
    
    
    //displayed texts
    fill (0);
    textAlign(CENTER);
    textSize(40);
    score = frameCount;
    text(score, width/4, height);
    text("lives: "+lives, width/2, height);


    //BOAT display
    boatX=mouseX;
    boatY=mouseY;
    fill(#F8FAF0, 5);
    ellipse(boatX, boatY, boat_r, boat_r);
    noStroke();
    
    imageMode(CENTER);
    image(boat, mouseX, mouseY, 80, 80);
    stroke(#F51B1B);
    fill(#F8FAF0, 5);
    ellipse(mouseX, mouseY, boat_r, boat_r);
    noStroke();

    //BOAT motion animation
    for (int i = 1; i < width; i++) { 
      xvals[i-1] = xvals[i];
    } 
    for (int i = 1; i < height; i++) {
      yvals[i-1] = yvals[i];
    }
    // Add the new values to the end of the array 
    xvals[width-1] = mouseX; //move of the mouse on X 
    yvals[height-1] = mouseX;

    for (int i=1; i<width; i++) {
      stroke(0);
      point(i, mouseX-xvals[i]/2);
      noStroke();
    }
    gameTime += frameRate*50; //equals 1 second if frameRate = 50 Hz (??)
  }

  //VISUAL OF THE MOVEMENT OF THE BOAT(CHANGE THE VISUAL IN X, NOT IN Y)
  //for (int i = 1; i < width; i++) { 
  // xvals[i-1] = xvals[i]; 
  // yvals[i-1] = yvals[i];
  // 
  //// Add the new values to the end of the array x
  //vals[width-1] = mouseX; //move of the mouse on X y
  //vals[height-1] = mouseX;


  //or (int i=1; i<width; i++) {

  // stroke(0);
  // point(i, mouseX-xvals[i]/2);
  // noStroke();
  //
}
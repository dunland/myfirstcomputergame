class Game {
  //General Game
  int lives=3;
  boolean gameOver;
  int score;
  int gameTime=0; // elapsed time since beginning of the game
  Welle[] wellen = new Welle[15];
  
  //Background SEE
  float rectX=0; 
  int speed=2;

  //BOAT
  PImage boat;
  float boatX, boatY;
  float boat_r = 70; //Radius of boat
  float boatXdist, boatYdist; //distance to mouse
  float boatV = 0.05; //the boat's velocity towards mouse
  //Boat motion effects
  int num=40;
  float mx[] =new float [num];
  float my[] =new float [num];
  int[] xvals;
  int[] yvals;

  //obstacle setup
  int obstacleIncrement=5; // time in seconds after which 1 new object is created
  int obstacleAmount=5; //start amount of obstacles
  ArrayList<Obstacle> obstacles = new ArrayList<Obstacle>();


  Game() {
    score=0;
    println("go!");
    background(#C6F3F5);
    ellipseMode(CENTER);

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
    for (int i=0; i<obstacleAmount; i++) {
      println("initializing object "+i);
      obstacles.add(new Obstacle(random(1, 4), random(10, 50))); //a random number between 1 and x is taken. this number will be referred to when picking an image for the obstacle.
    }

    //BOAT setup
    boat =loadImage("boat.png");

    xvals=new int[width];
    yvals=new int[height];
  }






  void draw() {
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
      if (boatX+boat_r/2 >= obstacles.get(i).xPos-obstacles.get(i).o_rad && boatX-boat_r/2 <= obstacles.get(i).xPos+obstacles.get(i).o_rad) {
        if (boatY+boat_r/2 >= obstacles.get(i).yPos-obstacles.get(i).o_rad && boatY-boat_r/2 <= obstacles.get(i).yPos+obstacles.get(i).o_rad) {
          lives-=1;
          obstacles.get(i).yPos=0-obstacles.get(i).o_rad;
          obstacles.get(i).xPos = random(0, width-10);
          obstacles.get(i).o_rad = random(10, 50);
          obstacles.get(i).o_speed = random(0.5, 5);
        }
      }
      if (boatY+boat_r/2 >= obstacles.get(i).yPos-obstacles.get(i).o_rad && boatY-boat_r/2 <= obstacles.get(i).yPos+obstacles.get(i).o_rad) {
        if (boatX+boat_r/2 >= obstacles.get(i).xPos-obstacles.get(i).o_rad && boatX-boat_r/2 <= obstacles.get(i).xPos+obstacles.get(i).o_rad) {
          lives-=1;
          obstacles.get(i).yPos=0-obstacles.get(i).o_rad; //resets the obstacle position
          obstacles.get(i).xPos = random(0, width-10);
          obstacles.get(i).o_rad = random(10, 50);
          obstacles.get(i).o_speed = random(0.5, 5);
        }
      }
    }

    if (lives<=0) {
      gameOver = true;
    }

    //OBSTACLE-CREATION:
    //will add a new obstacle every [obstacleIncrement] seconds
    //(see below how gameTime constantly increases)
    if (gameTime % (obstacleIncrement*1000) <= 10) {
      obstacles.add(new Obstacle(random(1, 4), random(10, 50))); //the first random value needs to be adjusted as more images are added to the folder!
      println("obstacles: "+obstacles.size()+" gameTime: "+gameTime);
    }
    gameTime = millis(); //updates the gameTime to be elapsed time [ms]



    //displayed texts
    fill (0);
    textAlign(CENTER);
    textSize(40);
    score = frameCount;
    text(score, width/4, height);
    text("lives: "+lives, width/2, height);


    //BOAT motion
    boatXdist = boatX-mouseX;
    boatX -= boatV*boatXdist;
    boatYdist = boatY-mouseY;
    boatY -= boatV*boatYdist;

    ////BOAT motion visual effects
    for (int i = 1; i < width; i++) { //overwrites the array from beginning to end 
      xvals[i-1] = xvals[i];
    } 
    for (int i = 1; i < height; i++) {
      yvals[i-1] = yvals[i];
    }
    // Add the new values to the end of the array 
    xvals[width-1] = int(boatX); //move of the mouse on X 
    yvals[height-1] = int(boatX);

    for (int i=1; i<width; i++) {
      stroke(0);
      point(i, boatX-xvals[i]/2);
      noStroke();
    }
    fill(#7ECAF0, 20);
    int which = frameCount % num;
    mx[which] = boatX-1;
    my[which] = boatY;

    for (int i = 0; i < num; i++) {
      // which+1 is the smallest (the oldest in the array)
      int index = (which+1 + i) % num;
      ellipse(mx[index], my[index], i, i);
    }
    
    //BOAT display
    fill(#F8FAF0, 5);
    ellipse(boatX, boatY, boat_r, boat_r);
    noStroke();
    imageMode(CENTER);
    image(boat, boatX, boatY, 80, 80);
    stroke(#F51B1B);
    fill(#F8FAF0, 5);
    ellipse(boatX, boatY, boat_r, boat_r);
    noStroke();
  }
}
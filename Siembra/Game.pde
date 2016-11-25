class Game {

  ////VISUAL POINTS OF THE BOAT
  //int[] xvals;
  //int[] yvals;
  //int [] bvals;

  //Collision
  float boatX, boatY;

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
  
  boolean gameOver;
  int score;

  Welle[] wellen = new Welle[15];

  Obstacle plank1, plank2, plank3;

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
    wellen[9] =new Welle (300, #7EC4FF, 50);
    wellen[10] = new Welle(350, #538DBF, 50);
    wellen[11] = new Welle(400, #206198, 50);
    wellen[12] =new Welle (450, #9DCEF7, 50);
    wellen[13] = new Welle (500, #538DBF, 50);
    wellen[14] =new Welle (550, #206198, 50);

    plank1 = new Obstacle();
    plank2 = new Obstacle();
    plank3 = new Obstacle();
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
    
    noStroke();
    background(#C6F3F5);

    for (Welle welle : wellen) {
      welle.draw();
    }

    plank1.move();
    plank1.display();
    /* plank2.move();
     plank2.display();
     plank3.move();
     plank3.display();*/

    //BOAT
    boatX=mouseX;
    boatY=mouseY;
    fill(#F8FAF0, 5);
    ellipse(boatX, boatY, 70, 70);
    noStroke();

    /*OBSTACLE-BOAT-INTERACTION:
     vertical and horizontal distances are checked to be within obstacle radius.
     When both dimensions are reached, one life is lost.
     Check proximity
     so far for plank1 only*/
    //for (int i=0; i<=3; i++){
    if (boatX >= plank1.xPos-plank1.o_rad && boatX <= plank1.xPos+plank1.o_rad) {
      if (boatY >= plank1.yPos-plank1.o_rad && boatY <= plank1.yPos+plank1.o_rad) {
        lives-=1;
        plank1.yPos=0-plank1.o_rad;
        plank1.xPos = random(0, width-10);
        plank1.o_rad = random(0, 50);
        plank1.o_speed = random(0.5, 5);
      }
    }
    if (boatY >= plank1.yPos-plank1.o_rad && boatY <= plank1.yPos+plank1.o_rad) {
      if (boatX >= plank1.xPos-plank1.o_rad && boatX <= plank1.xPos+plank1.o_rad) {
        lives-=1;
        plank1.yPos=0-plank1.o_rad;
        plank1.xPos = random(0, width-10);
        plank1.o_rad = random(0, 50);
        plank1.o_speed = random(0.5, 5);
      }
    }
    fill (0);

    textAlign(CENTER);
    textSize(40);
    score = frameCount;
    text(score, width/4, height);


    text("lives: "+lives, width/2, height);
    
    imageMode(CENTER);
    image(boat, mouseX, mouseY, 80, 80);
    stroke(#F51B1B);
    fill(#F8FAF0, 5);
    ellipse(mouseX, mouseY, 70, 70);
    noStroke();

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
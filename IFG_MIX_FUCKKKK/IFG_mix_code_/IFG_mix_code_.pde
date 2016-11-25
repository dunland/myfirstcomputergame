
//Collision
float boatX, boatY;

//text and image
PImage boat;
int lives=3;

//Background SEE
float rectX=0; 
int speed=2;



Welle welle1;
Welle welle2;
Welle welle3;
Welle welle4;
Welle welle5;
Welle welle6;
Welle welle7;
Welle welle8;
Welle welle9;
Welle welle10;
Welle welle11;
Welle welle12;
Welle welle13;
Welle welle14;
Welle welle15;

Obstacle plank1, plank2, plank3;

void setup() {
  background(#C6F3F5);
  size(600, 600);

  noSmooth();
 

  welle13 = new Welle(0, #A3CBE3, 250);
  welle14 = new Welle(200, #328ABF, 250);
  welle15 = new Welle(400, #1999E5, 200);

  welle1 = new Welle(0, #206198, 50);
  welle2 = new Welle(50, #538DBF, 50);
  welle3 = new Welle(100, #7EC4FF, 50);
  welle4 = new Welle(150, #9DCEF7, 50);
  welle5 = new Welle(200, #206198, 50);
  welle5 = new Welle(200, #206198, 50);
  welle6 = new Welle(250, #9DCEF7, 50);
  welle7 =new Welle (300, #7EC4FF, 50);
  welle8= new Welle(350, #538DBF, 50);
  welle9= new Welle(400, #206198, 50);
  welle10 =new Welle (450, #9DCEF7, 50);
  welle11= new Welle (500, #538DBF, 50);
  welle12 =new Welle (550, #206198, 50);

  plank1 = new Obstacle();
  plank2 = new Obstacle();
  plank3 = new Obstacle();
  ellipseMode(CENTER);
  println(lives);

  boat =loadImage("boat.png");

  noSmooth();

}

class Welle {
  float x = 0;
  int hoehe = 50;
  int breite = 500;
  float speed = random(0.2, 4);
  int y;
  int farbe;

  Welle(int y, int farbe, int hoehe) {
    this.y = y;
    this.farbe = farbe;
    this.hoehe = hoehe;
  }

  void draw() {
    x=x+speed;
    fill(farbe);
    rect(x, y, breite, hoehe);
    if ((x+breite>=width) || (x<=0)) {
      speed=speed*-1;
    }
  }
}
//OBSTACLES-BOAT-MONSTER

class Obstacle {
  float xPos;
  float yPos;
  float o_rad; //ellipse radius
  float o_speed;


  Obstacle() {
    xPos = random(0, width-10);
    o_rad = random(0, 50);
    //o_width = 10;
    o_speed = random(0.5, 5);
  }


  void display() {
    fill(0);
    ellipse(xPos, yPos, o_rad, o_rad);
    // println("x: "+xPos+", y: "+yPos+", Radius: "+o_rad+", speed: "+o_speed);
  }
  void move() {
    yPos+=o_speed;
    if (yPos>=height+o_rad) { //makes obstacles disappear only after leaving the display field entirely
      xPos = random(0, width-10);
      o_rad = random(0, 50);
      o_speed = random(0.5, 5);
      yPos=0-o_rad;
    }
  }
}
//PRINCIPAL DRAW
void draw() {

  noStroke();
  background(#C6F3F5);


  welle13.draw();
  welle14.draw();
  welle15.draw();

  welle1.draw();
  welle2.draw();
  welle3.draw();
  welle4.draw();
  welle5.draw();
  welle6.draw();
  welle7.draw();
  welle8.draw();
  welle9.draw();
  welle10.draw();
  welle11.draw();
  welle12.draw();

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
  text(frameCount, width/4, height);


  text("lives: "+lives, width/2, height);
  if (lives<=0) {
    noLoop();
  }
  imageMode(CENTER);
  image(boat, mouseX, mouseY, 80, 80);
  stroke(#F51B1B);
  fill(#F8FAF0, 5);
  ellipse(mouseX, mouseY, 70, 70);
  noStroke();
  
 
  }
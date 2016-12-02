class Obstacle {
  float xPos;
  float yPos;
  float o_rad; //ellipse radius
  float o_speed;
  int imgNum; //the image number of the obstacle to load
  PImage o_img;
//  PImage o_img1, o_img2, o_img3;

  Obstacle(float init_imgNum, float init_o_rad) {
    this.imgNum = int(init_imgNum);
    this.o_rad = init_o_rad;
    xPos = random(0, width-10);
    o_speed = random(0.5, 5);
  }

  void display() { 
    o_img = loadImage("obstacle"+imgNum+".png");
    image(o_img,xPos,yPos,o_rad,o_rad);
    noFill();
    // println("x: "+xPos+", y: "+yPos+", Radius: "+o_rad+", speed: "+o_speed);
  }
  
  void move() {
    yPos+=o_speed;
    if (yPos>=height+o_rad) { //makes obstacles disappear only after leaving the display field entirely
      xPos = random(0, width-10);
      o_rad = random(10, 50);
      o_speed = random(0.5, 5);
      yPos=0-o_rad;
    }
  }
}
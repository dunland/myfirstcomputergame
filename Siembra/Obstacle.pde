class Obstacle {
  float xPos;
  float yPos;
  float o_rad; //ellipse radius
  float o_speed;

  Obstacle() {
    xPos = random(0, width-10);
    o_rad = random(0, 50);
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
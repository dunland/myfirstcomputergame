class Snowflake {
  float x, y;
  float speed;
  
  
  Snowflake() {
    x = random(width);
    y = random(height);
    speed = random(3);
  }
  
  void display() {
    if (y > height) {
      x = random(width);
      y = 0;
      speed = random(3);
    }
    strokeWeight(2);
    stroke(255);
    point(x, y);
    y += speed;
    x += map(noise(y), 0, 1, -5, 5);
  }
}
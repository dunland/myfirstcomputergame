PImage mountainscapeImg;
PImage flameImg;
float time = 0;
float moonX = 600, moonY = 50, moonR = 40;
Snowflake[] snowflakes = new Snowflake[100];

void setup() {
  size (700, 500);
  surface.setResizable(true);
  mountainscapeImg =loadImage("mountainscape.png");

  flameImg = loadImage("flame.png");

  for (int i = 0; i < snowflakes.length; i++) {
    snowflakes[i] = new Snowflake();
  }
}

void draw() {
  background(17, 23, 167);
  time += 1 / frameRate;
  stroke(255);
  background();

  stars();
  moon();
  fire();
  snow();
}

void stars() {
  for (int i =0; i < 100; i++) {
    float x = noise (i, 0) * width;
    float y = noise(i, 1) * height / 4;
    stroke (255 * noise(i, time));
    point (x, y);
  }
}

void moon() {
  noStroke();
  fill(240 + noise(time / 1) * 15, 240 + noise(time / 1) * 15, 191 + noise(time / 1) * 63);
  ellipse (width - moonR * 3, moonY, 2 * moonR, 2 * moonR);
}

void fire() {
  noStroke();
  float a = noise(time / 0.5) * 191;
  fill(240, 141, 65, a);
  ellipse(width / 2, height / 1.27, 70, 70);

  imageMode(CENTER);
  image(flameImg, width / 2, height / 1.25, 60, 60);
}

void snow() {
  for (int i = 0; i < snowflakes.length; i++) {
    snowflakes[i].display();
  }
}

void background() {
  imageMode(CORNER);
  image(mountainscapeImg, 0, 0, width, height);
}
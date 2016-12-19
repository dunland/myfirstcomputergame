PImage mountainscapeImg;
PImage flameImg;

void setup() {
  size (700, 500);
  //fullScreen (P3D);
  surface.setResizable(true);
  mountainscapeImg =loadImage("mountainscape.png");
}

float time = 0;
float moonX = 600, moonY = 50, moonR = 40;

void draw() {
  imageMode(CORNER);
  image(mountainscapeImg, 0, 0, width, height);
  time += 1 / frameRate;
  //  background(0);
  stroke(255);
  stars();
  moon();
  flameImg = loadImage("flame.png");
  imageMode(CENTER);
  //image(flameImg, 346, 400, 50, 50);
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
  for (int j = 0; j < 100; j++) {
    noStroke();
    fill(240 + noise(time/10) * 15, 240 + noise(time/10) * 15, 191 + noise(time/10) * 63);
    //println(240 + noise(time/10) * 15);
    ellipse (width - moonR * 3, moonY, 2 * moonR, 2 * moonR);
  }
}
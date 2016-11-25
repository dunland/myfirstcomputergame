class Welle {
  float x = 0;
  int hoehe = 50;
  int breite = width-100;
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
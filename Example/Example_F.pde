void setup() {
  size(200,200);
  int summe = addition(10, 2);
  maleErgebnis(summe);
}

void maleErgebnis(int ergebnis) {
   text(ergebnis, 10, 50);
   text(ergebnis, 10, 100);
}

int addition(int a, int b) {
 int ergebnis = a + b;
 return ergebnis;
}
class Intro {

  PFont font;
  import ddf.minim.*;

  Minim minim;
  AudioPlayer player;

  Intro(Minim minim) {
    player = minim.loadFile("MAL.mp3");
    player.play();
  }



  void draw() {
    background(#A6EAE5);

    fill(#185538, 50);
    //font = createFont("/Library/Fonts/GujaratiMTBold.ttf", 67);
    //textFont(font,67);
    textSize(100);
    text("SIEMBRA", 300, 400);
    stroke(#07403C, 50);
    // draw the waveforms
    // the values returned by left.get() and right.get() will be between -1 and 1,
    // so we need to scale them up to see the waveform
    // note that if the file is MONO, left.get() and right.get() will return the same value
    for (int i = 0; i < player.bufferSize() - 5; i++) {
      float x1 = map( i, 0, player.bufferSize(), 0, width-10);
      float x2 = map( i+1, 0, player.bufferSize(), 0, width-10 );
      stroke(#0F643A, 30);
      line( x1, 600 + player.left.get(i)*50, x2, 400 + player.left.get(i+1)*250 );
      stroke(#0F0CF7, 30);
      line( x1, 150 + player.right.get(i)*50, x2, 150 + player.right.get(i+1)*10 );
      stroke(#0F643A, 30);
      line( x1, 500 + player.left.get(i)*50, x2, 300 + player.left.get(i+1)*50 );
    }
  }
}
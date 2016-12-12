//Each of these elements shall contain at least 
//one purposefully used loop and utilitze noise to look random in a natural way.
//At least two of these elements shall change over time.

//NOISE SPACE: noise function works as a "screenshooting" and allows movement 
//and perseption in the space
//Steps of 0.005-0.03
float time=0;

void setup(){
size(800,400);
}

void draw(){
background(#BEE1E8);

  float x=0;
  float y=0;
  while(x<width){
    stroke(random(200),random(100),random(255));
    //we can use this same code for made a candle using POINT rather than line
    //if we work in y coordinator. 
    point(200+50*noise(x/100,time),y);
    x=x+0.1;
    y=y+0.02;
  }
  time=time+1;
}
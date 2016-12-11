
float rot=0;

void setup() {
  size(400, 400);
  background(#B4EDEA);
  smooth();
  noStroke();
}

//draw rotation of rectangle. 
void draw_rotating_rectangle(float x, float y, float rect_size, float r) {
  translate(x, y);
  rotate(r);
  //in orden to let it move, the number must be bigger that 0
  ellipse(3, 3, rect_size, rect_size);
  // explain of this fnction
  //Replaces the current matrix of a shape with the identity matrix. 
  //The equivalent function in OpenGL 
  resetMatrix(); 
}
//general drawing
void draw() {
  //allow that the draw have a loop, whitout this the drawing overcroops
  background(#B4EDEA); 
  for (float x=0; x<8; x=x+1) {

    //describing the loop on y
    for (float y=0; y<8; y=y+1) {
      //(1space,x=the complete rectagle,y=the complete rectagle, size of the cubes inside)
      draw_rotating_rectangle(0+x*80, 0+y*50, 10, rot+y);
    }
  }
  rot=rot+0.1;//rotation of the animation
}
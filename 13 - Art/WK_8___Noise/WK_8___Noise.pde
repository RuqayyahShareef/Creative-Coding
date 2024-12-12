// noise is a continuous curve and it can be used as a random number generator by sampling its value
//sampling along curve difference between each successvive sample gives you numbers
//allows you to roduce artwork that looks hand generated, produce handwriting style, sketch like syles for expressive purpose
float smoothness = 0.1;
float pX = 0, pY = 0;

void setup(){
  size(800,100);
}

void draw(){
  // x pos depends on frameCount, but %width places it in the range 0-width
  float x = 2*
}

float diameter;
void setup(){
  size(400,400);
}

void draw(){
  roundel(width/2,height/2);
  roundel(width/2 + ,height/2);
}

// Draws layer of the roundel.
void layer(color hex, int x, int y, int diameter){
  fill(hex);
  ellipse(x, y, diameter, diameter);
}

// Draws a whole roundel.
void roundel(int x, int y){
  layer(#ff0066, x, y, 60);
  layer(#ff6699, x, y, 40);
  layer(#ff99cc, x, y, 20);
}

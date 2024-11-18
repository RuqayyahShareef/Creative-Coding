int red, green, blue;
void setup(){
  size(400,400);
  red = 128;
  green = 128;
  blue = 128;
}
void draw(){
  background(255);
  fill(red, green, blue);
  rectMode(CENTER);
  rect(width/2,height/2,100,100);
}
void keyPressed(){
  if (key == 'r'){
    red = red - 10;
  }
  if (key == 'R'){
    red = red + 10;
  }
  if (key == 'g'){
    green = green - 10;
  }
  if (key == 'G'){
    green = green + 10;
  }
  if (key == 'b'){
    blue = blue - 10;
  }
  if (key == 'B'){
    blue = blue + 10;
  }
}

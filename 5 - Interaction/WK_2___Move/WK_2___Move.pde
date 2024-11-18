float x, y;
void setup(){
  size(400,400);
  x = width/2;
  y = height/2;
}

void draw(){
  background(200);
  rectMode(CENTER);
  rect(x, y, 60, 60);
}

void keyPressed(){
  if (key == 'w'){
    y = y-1;// -- Move up
  }
  if (key == 's'){
    y = y+1;// -- Move down
  }
  if (key == 'd'){
    x = x+1;// -- Move right
  }
  if (key == 'a'){
    x = x-1;// -- Move left
  }
}

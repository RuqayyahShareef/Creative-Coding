void setup(){
  size(1000,1000);
  background(255);
  noStroke();
}

void draw(){
  fill(mouseX,0,mouseY, 50);
  circle(mouseX, mouseY,20);
}

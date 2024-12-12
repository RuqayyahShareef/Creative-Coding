PVector p;
boolean drawCircle = true;
ArrayList<PVector> clickPoint = new ArrayList<PVector>();

void setup(){
  size(800,800);
  noStroke();
  p = new PVector(mouseX, mouseY);
}

void draw() {
  fill(255,8);
  rect(0,0,width,height);
  
  // instance of the p class called 'x' and 'y'.
  p.x = mouseX;
  p.y = mouseY;
  beginShape();
  for (PVector v :clickPoint){
    vertex(v.x, v.y);
    println(v.x, v.y);
  }
  endShape();
  
  if (drawCircle){
    fill(32, 128);
    circle(p.x, p.y, 12);
  }
  drawCircle = false;
  println(clickPoint.size());
    
}
void mouseClicked(){

}

void mouseMoved(){
  drawCircle = true;
}

void setup(){
  textSize(64);
  frameRate(5);
}

void draw(){
  background(250);
  fill(32);
  float xPos = random(40,45);
  text(key, xPos, 70);
}

void keyPressed(){
  if(key == 'r'){
    background(250,250,32);
  }
}

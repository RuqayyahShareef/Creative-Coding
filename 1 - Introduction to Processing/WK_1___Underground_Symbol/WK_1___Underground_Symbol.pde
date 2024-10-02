void setup()
{
  size(600,400);
  noStroke();
}

void draw() {
  // x and y coordinate variables
  float x = width/2;
  float y = height/2;
  
  // Red outer circle, at the centre of the canvas
  fill(255,0,0);
  circle(x, y, 300);
  
  // White inner circle, at the centre of the canvas
  fill(255);
  circle(x, y, 175);
  
  // Indigo rectangle
  fill(0,0,255);
  // Set rectMode to CENTER (x and y coordinates are now taken from center instead of top-left corner)
  rectMode(CENTER);  
  rect(x, y, 400,50);
  
  // Text in the rectangle
  textSize(50);
  fill(255);
  textAlign(CENTER, CENTER);
  String underground = "UNDERGROUND";
  text(underground,x, y);
}

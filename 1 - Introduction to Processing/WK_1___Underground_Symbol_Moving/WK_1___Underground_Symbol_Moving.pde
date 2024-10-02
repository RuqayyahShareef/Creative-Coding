void setup()
{
  size(600,400);
  noStroke();
}

void draw() {
  background(200);
  // x and y coordinate variables
  float x = mouseX;
  float y = mouseY;
  float multiplier = 1;
  // If the mouse is pressed, draw it bigger.
  if (mousePressed){
    multiplier = 1.15;
  }
  
  // Red outer circle, at the centre of the canvas
  fill(255,0,0);
  circle(x, y, 300*multiplier);
  
  // White inner circle, at the centre of the canvas
  fill(255);
  circle(x, y, 175*multiplier);
  
  // Indigo rectangle
  float rectWidth = 400;
  float rectHeight = 50;
  fill(0,0,255);
  // Set rectMode to CENTER (x and y coordinates are now taken from center instead of top-left corner)
  rectMode(CENTER);  
  rect(x, y, rectWidth*multiplier,rectHeight*multiplier);
  
  // Text in the rectangle
  textSize(50);
  fill(255);
  if (mousePressed){
    fill(252, 244, 17);
}
  textAlign(CENTER, CENTER);
  String underground = "UNDERGROUND";
  text(underground,x, y);
}

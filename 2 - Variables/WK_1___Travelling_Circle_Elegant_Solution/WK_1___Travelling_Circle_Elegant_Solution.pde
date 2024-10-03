/* Write a sketch that draws a circle in the centre of a square window.
   Use two variables x and y to specify the position of the circle: */
   
// Declare variables to be used throughout program scope
float x;
float y;
// Offset counter to increment distance away from the centre (direction modified in individual draw functions).
int delta;

void setup(){
  size(400,400);
  x = width/2;
  y = height/2; 
  // Offset counter to be incremented each frame.
  delta = 0;
}

void draw(){
  // Draw circle travelling NW from centre.
  fill(148, 184, 24);
  ellipse(x-delta, y-delta, 60, 60);
  
  // Draw circle travelling NE from centre.
  fill(73, 222, 165);
  ellipse(x+delta, y-delta, 60, 60);
  
  // Draw circle travelling SE from centre.
  fill(104, 73, 222);
  ellipse(x+delta, y+delta, 60, 60);
  
  // Draw circle travelling SW from centre.
  fill(184, 46, 24);
  ellipse(x-delta, y+delta, 60, 60);
  
  // Increment offset counter by one
  delta += 1;
}

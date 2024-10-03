/* Write a sketch that draws a circle in the centre of a square window.
   Use two variables x and y to specify the position of the circle: */
float x1, x2, x3, x4;
float y1, y2, y3, y4;
void setup(){
  size(400,400);
  x1 = x2 = x3 = x4  = width/2;
  y1 = y2 = y3 = y4 = height/2;  
}

void draw(){
  // Create some colour variables.
  color circ_nw = color (148, 184, 24);
  color circ_ne = color (73, 222, 165);
  color circ_se = color (104, 73, 222);
  color circ_sw = color (184, 46, 24);
  
  
  // Draw circle travelling NW from centre.
  fill(circ_nw);
  ellipse(x1, y1, 60, 60);
  // Increment/decrement the values of x and y every time draw() is executed.
  x1 = x1-1;
  y1 = y1-1;
  
  // Draw circle travelling SE from centre.
  fill(circ_se);
  ellipse(x2, y2, 60, 60);
  // Increment/decrement the values of x and y every time draw() is executed.
  x2 = x2+1;
  y2 = y2+1;
  
  // Draw circle travelling SW from centre.
  fill(circ_sw);
  ellipse(x3, y3, 60, 60);
  // Increment/decrement the values of x and y every time draw() is executed.
  x3 = x3-1;
  y3 = y3+1;
  
  // Draw circle travelling NE from centre.
  fill(circ_ne);
  ellipse(x4, y4, 60, 60);
  // Increment/decrement the values of x and y every time draw() is executed.
  x4 = x4+1;
  y4 = y4-1;
}

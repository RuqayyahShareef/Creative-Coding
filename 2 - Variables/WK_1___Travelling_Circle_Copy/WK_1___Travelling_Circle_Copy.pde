/* Write a sketch that draws a circle in the centre of a square window.
   Use two variables x and y to specify the position of the circle: */
float x;
float y;
void setup(){
  size(400,400);
  x = width/2;
  y = height/2;  
}

void draw(){
  // Create some colour variables.
  color circ_nw = color (148, 184, 24);
  color circ_ne = color (73, 222, 165);
  color circ_se = color (104, 73, 222);
  color circ_sw = color (184, 46, 24);
  
  
  // Draw circle travelling NW from centre.
  fill(circ_nw);
  ellipse(x, y, 60, 60);
  // Increase the values of x and y every time draw() is executed.
  ///x = x-1;
  //y = y-1;
  
  // Draw circle travelling NE from centre.
  fill(circ_ne);
  ellipse(x, y, 60, 60);
  // Increase the values of x and y every time draw() is executed.
  //x = x+1;
  //y = y-1;
}

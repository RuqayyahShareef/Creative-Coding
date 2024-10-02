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
  // Draw circle in centre of canvas.
  ellipse(x, y, 60, 60);
  // Increase the values of x and y every time draw() is executed.
  x = x-1;
  y = y-1;
}

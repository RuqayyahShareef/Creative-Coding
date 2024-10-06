// Declare global coordinate variables.
float x;
float y;
int diameter;
int rectLength;

// Set canvas size and generate random x and y coordinate.
void setup() 
{
  size(200,300);
  // Diameter of the circle to be drawn.
  diameter = 100;
  // Width of rectangle
  rectLength = 130;
  
  // Choose a random coordinate position.
  
  // the distance from the centre of the circle to the edge of the circle + the overhanging edge of the rectangle
  float xOffset = (diameter/2)+((rectLength - diameter)/2);
  
  // random function is inclusive of both ends of the parameters.
  x = random(xOffset, width - xOffset);
  y = random(diameter/2,height - diameter/2);
}
 
void draw()
{
  // Variables for the colour
  color circleCol = color(255);
  color rectCol = color(255);
  
  // Check if the mouse pointer is within the rectangle shape.
  boolean rectLeft = (mouseX >= (x-(130/2)));
  boolean rectRight = (mouseX <= (x+(130/2)));
  boolean rectUpper = (mouseY >= (y - (20/2)));
  boolean rectLower = (mouseY <= (y + (20/2)));

  // If the mouse pointer is in the rectangle it will be within the four edges.
  // The rectangle colour wil change to blue for this frame.
  if (rectLeft && rectRight && rectUpper && rectLower){
    rectCol = color (0,0,255);
  }
  
  else {
    fill(255);
    // If mouse is not inside the rectangle, 
    // but is inside the circle, the circle is filled red instead of white.
    
    // Calculate distance between mouse pointer and centre of the circle.
    float distance = dist(mouseX, mouseY, x, y);
    // Change the circle colour if mouse inside the circle but not the rectangle.
    if (distance < diameter/2){
      circleCol = color (255,0,0);
      
    }
  }
  
  // Draw a circle.
  fill(circleCol);
  ellipse(x,y,diameter,diameter);
  
  // Draw a rectangle.
  fill(rectCol);
  rectMode(CENTER);
  rect(x, y, 130,20);


}

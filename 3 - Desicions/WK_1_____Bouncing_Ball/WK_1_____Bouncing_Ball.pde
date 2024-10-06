float xPosition;  // -- Horizontal starting position on 'x' axis in coordinate space
float xVelocity; // -- Horizontal speed in x-direction
float yPosition;  // -- Vertical starting position on 'y' axis in coordinate space
float yVelocity; // -- Vertical speed in y-direction
int diameter; // -- Diameter of circle to be drawn.
color ballColour; // -- Colour of the ball
int count; // Counter to count number of times ball has hit, that should not reset every frame, but should when we ask it to reset.

void setup()
{
  size(400,300);
  fill(255,177,8);
  textSize(48);
  count = 0; // -- Initialise counter value to count number of time ball hits a side.
  
  diameter = 100; // Initialise diameter of circle to be drawn.
  xPosition = width/2;  // -- Initialise xPosition to centre of sketch
  xVelocity = -2; // -- Initialise speed in x-direction to -2 (moving left)
  
  yPosition = height/2;  // -- Initialise yPosition to centre of sketch
  yVelocity = 1; // -- Initialise speed in y-direction to 1 (moving down)
}
 
void draw()
{
  background(64);
  xPosition = xPosition + xVelocity;  // -- Change position in x on each redraw by velocity in x
  yPosition = yPosition + yVelocity;  // -- Change position in y on each redraw by velocity in y
  
  ellipse(xPosition, yPosition, diameter, diameter);
  
  boolean overLeft = xPosition <= diameter/2; // x position when the ball reaches the left side of the screen.
  boolean overRight = xPosition >= width - (diameter/2); // x position when the ball reaches the right side of the screen.
  boolean overTop = yPosition <= diameter/2; // y position when the ball reaches the top side of the screen.
  boolean overBottom = yPosition >= height - (diameter/2); // y position when the ball reaches the bottom side of the screen.
  boolean hit = false; // -- Flag to signify when the ball hit a side
  if (overLeft||overRight){// if the ball reaches the edge of the screen (or just over it)
    xVelocity = -xVelocity; // Change the direction of movement ('bounce' off the wall)
    count = count + 1; // -- Increment hit counter
    if (count == 3){ // -- If it is every third count, change the colour of theball and reset counter
      fill(random(0, 255),random(0, 255), random(0, 255)); // -- Randomise RGB fill colour
      count = 0;
    }
    if (dist(mouseX, mouseY, xPosition, yPosition)< diameter/2){// -- If the mouse is inside the ball
      xVelocity = xVelocity * 1.2; // -- Increase the speed of the ball
    }
  }
  if (overTop||overBottom){// if the ball reaches the edge of the screen (or just over it)
    yVelocity = -yVelocity; // Change the direction of movement ('bounce' off the wall)
    count = count + 1; // -- Increment hit counter
    if (count == 3){ // -- If it is every third count, change the colour of theball and reset counter
       fill(random(0, 255),random(0, 255), random(0, 255)); // -- Randomise RGB fill colour
       count = 0;
    }
    if (dist(mouseX, mouseY, xPosition, yPosition)< diameter/2){// -- If the mouse is inside the ball
      yVelocity = yVelocity * 1.2; // -- Increase the speed of the ball
    }
  }
}

// -- Declare global variables.
float xPos, yPos; // -- Centre position of the circle.
int radius; // -- Radius of the circle.
int timeLimit; // -- Time limit set to find the circle.
int textBar; // -- Vertical offset created by the 'time limit' message bar on the canvas.

void setup(){
  size(300+35,200);
  radius = 50; // -- Set value of circle radius.
  textSize(30);
  textAlign(CENTER, BOTTOM);
  textBar = 35; // -- Vertical offset of the textbar.
  timeLimit = 5; // -- Time limit to find the circle.
  // -- Generate random coordinates to draw a circle that doesn't overflow the canvas
  xPos = random(radius, width - radius);
  yPos = random(radius+textBar, height - radius);
}

void draw(){
  background(200);
  int seconds = frameCount/60; // -- Calculates the number of seconds passed
  int timeLeft = timeLimit - seconds; // -- Time left for user to find circle.
  
  fill(0); // Black 'Time Left' text and line
  text("Time Left: "+timeLeft, width/2, textBar);
  line(0, textBar, width, textBar);
  
  // -- If the distance between the cursor and the centre of the circle is less than the circles radius
  // -- i.e. the cursor is inside the potential circle
  if(dist(mouseX, mouseY, xPos, yPos)< radius){
    fill(255); // Draw a white circle.
    ellipse(xPos, yPos, radius*2, radius*2); // -- Draw the visible circle.
    
    // If the circle is found, freeze the canvas, display the winning message in green.
    frameRate(0);
    fill(30,255,100);
    text("YOU WIN", width/2, height/2);
  }
  
  // If the time reaches 0 without the circle being found, freeze the canvas, display game over message in red.
  if(timeLeft <= 0){
    frameRate(0);
    fill(255,0,100);
    text("GAME OVER", width/2, height/2);
  }
  
}

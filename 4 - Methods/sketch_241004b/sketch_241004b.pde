// -- Global variables are declared first
 
// ball position
float xPos;
float yPos;
 
// peg positions
float peg1X, peg1Y;
float peg2X, peg2Y;
float peg3X, peg3Y;
 
// ball velocity
float vx;
float vy;
 
// ball size
float radius;
 
// peg size
float pegRadius;
 
// is ball in play?
boolean inPlayMode;     // <-- boolean variable, can only hold values of TRUE and FALSE.
 
void setup()            // <-- Whatever commands we put in here will be executed once.
{
    size(500, 400);
    textSize(48);
 
    radius = 15;
 
    pegRadius = 10;
 
    peg1X = 250;
    peg1Y = 200;
 
    peg2X = 70;
    peg2Y = height - 24;
 
    peg3X = width - 24;
    peg3Y = 70;
 
    xPos = width - radius;
    yPos = height - radius;
 
    inPlayMode = false;   // <-- Initialise 'inPlayMode' to FALSE
}
 
// -- A new method
void mousePressed()
{
    if (inPlayMode)       // <-- Check whether this is TRUE, else change vx and vy, and set inPlayMode to TRUE
    {
    // -- do nothing, ball is already in play
    } else
    {
    vx = estimateVelocity(mouseX , xPos);
    vy = estimateVelocity(mouseY , yPos);
    inPlayMode = true;
    }
}

float estimateVelocity(float a , float b){
  float vel = (a - b)/50;
  return vel;
}
 
void draw()
{
    background(255);
 
    fill(255, 0, 0);
    stroke(0);
 
    // -- Draw the pegs
    circle(peg1X, peg1Y, 2 * pegRadius);
    circle(peg2X, peg2Y, 2 * pegRadius);
    circle(peg3X, peg3Y, 2 * pegRadius);
 
    // -- Lots of decisions that define the game!
    if (inPlayMode)
    {
    xPos = xPos + vx;
    yPos = yPos + vy;
 
    // -- Draw ball
    noStroke();
    fill(0, 0, 255);
    circle(xPos, yPos, 2 * radius);
     
    //bounceOffWalls(xPos, width, vx);
    //bounceOffWalls(yPos, height, vy);
     //-- Check rebounds against left and right walls
    if (xPos - radius < 0 || xPos + radius > width)
    {
        vx = -vx;
    }
 
    // -- Check rebounds against top and bottom walls
    if (yPos - radius < 0 || yPos + radius > height)
    {
        vy = -vy;
    }
     
    checkForPegCollisions(peg1X, peg1Y);
    checkForPegCollisions(peg2X, peg2Y);
    checkForPegCollisions(peg3X, peg3Y);

    } else
    {
    drawBall();
    drawAimingLine();
    }
}


void drawAimingLine(){
    // -- Draw aiming line
    stroke(0);
    line(xPos, yPos, mouseX, mouseY);
}

void drawBall(){
    // -- Draw ball
    noStroke();
    fill(0, 0, 255);
    circle(xPos, yPos, 2 * radius);
}

void checkForPegCollisions(float x, float y){
    // -- Check collisions with pegs
    if (dist(xPos, yPos, x, y) < radius + pegRadius)
    {
        fill(0);
        textAlign(CENTER, CENTER);
        text("GAME OVER!", width/2, height/2);
        frameRate(0);
    }
}

//void bounceOffWalls(float position, float direction, float velocity){
//    // -- Check rebounds against walls.
//    if (position - radius < 0 || position + radius > direction)
//    {
//        return (-velocity);
//    }
//}

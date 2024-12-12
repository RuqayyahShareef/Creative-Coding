// global variable
int angle = 0; // how much the rotation is at a given tiem.

void setup(){
  size(600,600);
}

void draw(){
  //angle++; // increment every iteration.
  background(255);
  stroke(0);
  fill(150,0,0);
  rectMode(CENTER);
  
  // translate() displaces objects in the window
  // how it works: it moves the system of reference in the display window
  // basically: the top left corner of the coordinate grid is default at 0,0
  // translate makes the new top left corner of the coordinate grid to the parameters
  // here the top left is at width/2, height/2
  translate(width/2, height/2);
  scale(0.5);
  pushMatrix(); // save system of reference
  rotate(radians(frameCount*120)); //frameCount naturally increments, multiplier to speed it up
  rect(0,0,200,200);
  // translating (moving the system of reference) is better than re-sepecifying coordinates each time.
  //rotate(-radians(frameCount*2)); //only make the first rect move so put BEFORE translate
  popMatrix(); // go back to last system of reference.
  translate(300, 0);
  
  rect(0,0,200,200);
  
  
  // scale and translate: the order does matter
  // translate first for position
  // scale for size after
  // scale shrinks the size of the axis.
  // e.g. scale(0.5) = makes a 200x200 sqaure 100x100
  
  //rotate() rotates system of reference 
  //takes parameters in radians
  
  
  // translate, scale and rotate have changed the system of reference and wont change back by themselves
  
  
  //animation
  
  
  // use pushMatrix() and popMatrix() too reduce repetition of undoing command
  // Pushes the current transformation matrix onto the matrix stack.
  //  The pushMatrix() function saves the current coordinate system to the stack and popMatrix() restores the prior coordinate system
  

  
    

  
  
  
}

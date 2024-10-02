
void setup(){
  size(600,400);
  stroke(255);
  strokeWeight(2);
}

void draw(){
  background(176, 217, 255);
  /*
   Better to use variable values so that code is easier scaled to canvas size.
   It allows you to differentiate between what is the centre position and how much is the offset.
   e.g. y-axis = 270, tells me that it is 270 pixels down from the top of the canvas
   but y-axis = height/2 +70 (= 200 + 70) tells me how much is the centre coordinate, and how much is the offset
  */
  int w = width/2; //300
  int h = height/2; //200
  
  //Grass
  fill(62, 107, 69);
  rect(0,height,width*2,70);
  
  // Sun
  fill(255, 211, 102);
  // arc(x,y,width,height,start,stop,(OPTIONAL PARAMETER: mode)) (start and stop refer to if 3'oclock was 0/2PI, 9'oclock is PI, so what range of arc you want to draw)
  // reference: https://www.youtube.com/watch?v=U8W6KNKCEM0
  arc(width, 0,200,200, HALF_PI, PI);
  
  // Set that x and y coordinates refers to center of square/rectangle.
  rectMode(CENTER);
  
  // Body of house
  int sqOffset = h+70; 
  // How much the body of the house is offset. i.e. the centre of the square (which has been lowered from the centre of the canvas by 70px).
  // All other shapes are drawn in relation to the position of the big square.
  fill(204, 196, 190);
  square(w,sqOffset,200);
  
  // Chimney
  fill(143, 95, 62);
  rect(w+50,sqOffset-160,20,50);
  
  // Chimney Smoke
  if(mousePressed){
    noStroke();
    fill(200);
    circle(w+50,sqOffset-190,10);
    circle(w+50,sqOffset-200,15);
    circle(w+50,sqOffset-210,20);
    stroke(255);
  }
  
  // Roof
  fill(237, 178, 137);
  triangle(w-100,sqOffset-100, w,sqOffset-200, w+100,sqOffset-100);
  
  // Door
  fill(135, 117, 123);
  rect(w,sqOffset+60,40,80);
  
  // Windows
  fill(176, 217, 232);
  square(w-60,sqOffset+30,40); // Bottom Left
  line(w-80, sqOffset+10, w-40, sqOffset+50);
  
  square(w+60,sqOffset+30,40); // Bottom Right
  line(w+40, sqOffset+10, w+80, sqOffset+50);
  
  square(w-60,sqOffset-45,40); // Top Left
  line(w-80, sqOffset-65, w-40, sqOffset-25);
  
  square(w+60,sqOffset-45,40); // Top Right
  line(w+40, sqOffset-65, w+80, sqOffset-25);
  
  
  
  
}

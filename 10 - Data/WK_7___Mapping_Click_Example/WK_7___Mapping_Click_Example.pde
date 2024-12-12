// -- globals to hold the top, bottom, left and right extents of the plotting range on the canvas
float yTop, yBot;
float xLft, xRgt;
 
void setup() {
  size(600,100);
   
  // -- set up plotting ranges as proportions of the canvas size:
  yTop = height*0.1;
  yBot = height*0.9;
  xLft = width*0.1;
  xRgt = width*0.9;
}
 
void draw() {
  background(250);
   
  for (int i=0; i<=5; i++) {
    float y = map (i, 0,4, yTop,yBot);    // <-- convert from 0-1 to y range on canvas 
    float r = random(660,1000);
    float x = map (r, 0,1000, xLft,xRgt); // <-- convert from 0-1000 to x range on canvas
     
    // -- draw a line in screen coordinates that represents r through its position on the canvas
    line(xLft,y, x,y);
    fill(64,12,12);
    text(int(r),x+4,y+4);
    text(i,xLft-12,y+4);
  }
   
  fill(64,12,12,128);
  text("Click for Another Go!",width-110,height-17);
  noLoop();
}
 
void mouseClicked() {
  loop();
} 

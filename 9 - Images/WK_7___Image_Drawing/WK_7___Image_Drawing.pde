int lineWidth;
color lineColour;
PImage myPic;

void setup(){
  size(720, 720);
  lineWidth = 5;
  lineColour = color(255,128);
  myPic = loadImage("https://media.4-paws.org/d/2/5/f/d25ff020556e4b5eae747c55576f3b50886c0b90/cut%20cat%20serhio%2002-1813x1811-720x719.jpg");
  image(myPic, 0, 0);
  strokeWeight(5);         // --   at a position given by the 2nd and 3rd arguments
  stroke(255,128);         // --   (0, 0) in this case
}

void draw() {
  if (mousePressed) {
    if (mouseButton == RIGHT){
      lineColour = myPic.get(mouseX,mouseY); //get the colour when right click
      stroke (lineColour); //make the stroke that colour
      fill (lineColour);
    }
    else{
      line(pmouseX, pmouseY, mouseX,mouseY); // draw the line
    }
  }

}
void keyPressed(){
  if(key == 'u'){
    background(255);
    image(myPic, 0 , 0);
  }
  else{
    save()
  }
  
}

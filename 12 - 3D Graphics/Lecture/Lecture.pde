// Read a text file into an array names 'lines' with loadStrings()
//String[] lines = loadStrings("namesData.txt");
//printArray(lines);
//println(lines[0]);

// (putting 10 on a range that is on a range from 0-100 , on a range of 0-width)
//float x = map(10,0,200,0,width);
//line(x,0,x,height);


//map is so important because it lets us fit things proportionally on the screen.
float barWidth = 0;
void setup(){
  size(900,150);
  noStroke();
  }
void draw(){
  background (255);
  fill(255,128,32,200);
  // change barwidth based in time( days in bootcamp/degree) : 5*11*2*3 =330
  rect(0,50,barWidth,50); // orange bar <- change width
  
  //50 min line
  fill(140);
  float x50 = map(50,0,60,0, width);
  
  
}

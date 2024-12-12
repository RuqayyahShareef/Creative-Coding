// -- a class for every observation of a lecturer saying "Ummm..." in a lecture
 
class Ummmm {
 
  // -- the fields that will be used to capture the observation, these will be filled with data
  String who, next;
  int day, min;
  int howBad, howLong;
  PVector coords = new PVector(0, 0);     // -- place to draw on the canvas - (0,0) initially
  PVector size = new PVector(100, 20);    // -- width and height - (100,20) initially
  color whoColour;
 
  // -- the Constructor is called whenever an object of this type is initialised:
  Ummmm (String person, String followed, int dayNum, int minNum, int badNum, int longNum) {
     
    who = person;
    next = followed;
    day = dayNum;
    min = minNum;
    howLong = longNum;
    howBad = badNum;
 
    float wi = map(howLong, 0, 5, 0, width/5.0);
    float hi = map(howBad, 0, 6, 0, height/20.0);
    size =  new PVector(wi, hi);
 
    // -- store the colour dependent upon the value of the "who" field:
    if (who.equals("JD")) {
      whoColour = colJD;
    } else if (who.equals("GT")) {
      whoColour = colGT;
    } else if (who.equals("GB")) {
      whoColour = colGB;
    } else {
      whoColour = color(200, 128);
    }
  }
 
  // -- draw method uses the coords and size PVectors to position, size and animate  
  //    the rectangle that represents the observation (and the data collected)
  void draw () {
    stroke(16, 200);
    fill(whoColour);
     
    // -- add random jitter in Y based on value (magnitude) of howBad:
    float randomY = random(-howBad,howBad);
    rect(coords.x, coords.y, size.x, size.y+randomY);
 
    // -- add text:
    fill(16, 200);
    text(next,coords.x, coords.y-size.y/2f-4);
  }
}
// -- An array of strings into which we will load our data file:
String [] dataFileRows;
 
// -- an empty ArrayList that will contain our Ummmm objects:
ArrayList<Ummmm> ummmms = new ArrayList<Ummmm>();
 
// -- colours for each of the lecturers:
color colJD, colGT, colGB;
 
 
void setup () {
  size(400, 500);
  rectMode(CENTER);
  textAlign(CENTER,BOTTOM);
   
  // -- specify the colours for JD, GT and GB:
  colJD = color(255,128,64,200);
  colGT = color(64,128,255,200);
  colGB = color(255,128,255,200);
 
  // -- Read the data and create the objects:
  int thisRow = 0;
   
  dataFileRows = loadStrings("ccData.Ummmm.csv"); // <-- load the data from file
   
  for (String row : dataFileRows) {
    if (thisRow >0) {  // <-- ignore the first row - column headers, not data
     
      // -- Split the row at each comma and store the output in a new 'tokens' array:
      String [] tokens = split(row, ",");
       
      // -- use tokens array to grab data from the row to populate object:
      String name = tokens[0];
      String next = tokens[3];
      int day = int(tokens[1]);
      int min = int(tokens[2]);
      int bad = int(tokens[4]);
      int len = int(tokens[5]);
      // -- you need to know which column each data item is in in your inout file to do this!
 
      // -- create a new object of type Ummmm - one for each row
      // -- using the data from the row to initialise the object:
      Ummmm u = new Ummmm(name, next, day, min, bad, len);
 
      // -- calculate the position at which to place the mark and store this in the object:
      float y = map(thisRow,  1,dataFileRows.length-1, height*0.05, height*0.95);
      float x = map(min, 0,120, width*0.05, width*0.95);
       
      // -- update the coordinates with the new PVector:
      u.coords = new PVector(x,y);
 
      // -- add the object it to the ArrayList of Ummmm objects
      ummmms.add(u);
    }
    thisRow++; // <-- keep a count of which row we are on
  }
}
 
 
void draw() {
  background(250);
   
  // -- loop through the Ummmms in the ArrayList and draw them by calling the draw() method!
  for (Ummmm u : ummmms) {
    u.draw();
  }
 
}
 
void mouseClicked () {
  int r = int(random(11111, 99999));
  save("canvas"+r+".png");
}

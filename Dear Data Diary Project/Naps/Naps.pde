// Dear Data Diary: Naps.
// NOTE: decided to omit access modifiers for simplictity.
/*
1 - Load data from text file.
2 - Create an object of the 'NapEvent' class from each line of data's tokens.
*/

// ArrayList of 'NapEvent' objects (each nap that was recorded).
ArrayList<NapEvent> napObjects = new ArrayList();

// code that runs once at start of program.
void setup(){
  size(1000,600); // sketch window size.
  fill(788,44,66); // shape fill colour = black.
  textSize(20); // size of any text displayed in window.
  
  
  // load text from file into an array of strings 'napRecords' (each element of the array is a line of text) .
  String[] napRecords = loadStrings("naps.txt");
  // loop through each element of 'napRecords' array:
  for (int i=0; i< napRecords.length; i++) {
      // put the output of split() function into an array 'napTokens' (with local scope to this for loop):
      String[] napTokens = split(napRecords[i],",");
      // pass the local array 'napTokens' which holds all of the data for one nap event in as an argument to the constructor to create a new 'NapEvent'.
      NapEvent nap = new NapEvent(napTokens);
      // add the created 'NapEvent' object to an ArrayList of nap objects called 'napObjects'.
      napObjects.add(nap);
  }
}

// code that runs continuously until termination/loop cancellation.
void draw(){
  // draw background colour.
  background(255);
  colorMode(HSB,1,1,1);
  background(0.12, 0.11, 0.95);
  
  // calculate sketch scaling offset.
  float x = map(7, 0,100, 0,width); // coordinate of 7% into the sketch (can be applied as an offset/value to either x or y coord).
  
  // draw axis lines.
  // line(xPosStart, yPosStart, xPosEnd, yPosEnd)
  line(x,10,x,(height-x)); // vertical line.
  line(x,(height - x),width,(height-x)); // horizontal line.
  
  // draw axis labels.
  textAlign(CENTER);
  text("Day",x/2,(height-x)/2); // vertical label.
  //text("Time of Day",(width-x)/2 ,(height-(x/8))); // horizontal label.
  text("00:00",x ,(height-(x/2)));
  text("06:00",((width-x)/4)+ x ,(height-(x/2))); 
  text("12:00",((width-x)/2) + x ,(height-(x/2)));
  text("18:00",(3*(width-x)/4) + x,(height-(x/2)));
    

  
  
  /*// draw rectangles.
  float section = (height - x - 15)/napObjects.size();
  float gridStartPos = (height - x);
  // for each nap object, draw a rectangle on the sketch.
  for (NapEvent n:napObjects){
    rect(x,gridStartPos - section, napObjects.get(0).duration, section*0.9);
    gridStartPos = gridStartPos - section;
  }*/
  // draw rectangles downwards
  float section = (height - x - 20)/napObjects.size();
  float gridStartPos = 20;
  // for each nap object, draw a rectangle on the sketch.
  for (NapEvent n:napObjects){
    rect(map(n.when, 0,(24*60), 0,width),gridStartPos, map(n.duration, 0,(24*60), 0,width), section*0.9);
    gridStartPos = gridStartPos + section;
  }
  
  
  
}

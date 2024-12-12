// Dear Data Diary: Naps.
// NOTE: decided to omit access modifiers for simplictity.
/*
1 - Load data from text file.
2 - Create an object of the 'NapEvent' class from each line of data's tokens.
*/

// ArrayList of 'NapEvent' objects (each nap that was recorded).
ArrayList<NapEvent> napObjects = new ArrayList();
// Hashmap for storing key:value pairs of reasons for taking a nap and their colours.
HashMap<String,Integer> reasonColour = new HashMap(){};
// Did the user want to see the presence of caffeine that day?
boolean caffeineShake = false;
// Does the user want to reveal nightsleep?
boolean nightTime = false;

// code that runs once at start of program.
void setup(){
  size(1000,600); // sketch window size.
  textSize(20); // size of any text displayed in window.
  
  // initilialise hashmap colours
  reasonColour.put("Tired",#87CBE3); // cornflower blue
  reasonColour.put("Sleepy",#a31aff); // light purple
  reasonColour.put("Headache",#e62e00); // red
  //println(reasonColour);
  
  
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
  fill(#003300); // default shape /text fill colour = dark green
  
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
    
  // draw rectangles downwards
  int lastDay = napObjects.get(napObjects.size()-1).day; //get value of last day recorded in array to determine how many day rows to represent.
  float section = (height - x - 20)/lastDay;
  float gridStartPos = 20-section;
  int prevDay = 1; // initialise variable to hold value of previous day to 1.
  // for each nap object, draw a rectangle on the sketch.
  for (NapEvent n:napObjects){
    // check if the day of the previous rectangle drawn is the same as the day for the current selected object
    //println(prevDay != n.day);
    if (prevDay != n.day){
      // if it isn't (i.e. this nap event is on a new day), change the value of the day counter to the new day value (i.e. same effect as incrementing).
      prevDay = n.day;
      // and offset the rectangle y-coordinate
      gridStartPos = gridStartPos + section;
    }
    int rectColour = reasonColour.get(n.reason);
    float opacity = map(n.quality,1,5,0,254);
    fill(rectColour,opacity);
    
    // check if the rectangle should shake, and if yes, add random jitter on Y value:
    float randomY = 0;
    //println(n.caffeine, caffeineShake);
    if (n.caffeine && caffeineShake){
      randomY = random(-10,10);
    }
    rect(map(n.when, 0,(24*60), 0,width),gridStartPos, map(n.duration, 0,(24*60), 0,width), section*0.9-randomY);
    
    // draw an overlapping rectangle based on proportion of nightsleep
    if (nightTime){
      fill(0.6,0.136,0.6,127);
      rect(x,gridStartPos,width-x,map(n.nightSleep,0,12,0,section*0.9-randomY));
    }
    
  }
}

// INTERACTION
void keyPressed() {
  if (key == 'c') {
    caffeineShake = true;
  }
  if (key == 'n'){
    nightTime = !nightTime; //switch the value of boolean variable so user can use key as a toggle.
  }
}

void keyReleased(){
  if (key == 'c') {
    caffeineShake = false;
  }
}

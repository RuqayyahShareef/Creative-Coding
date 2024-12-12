// -- Global variables ...
// -- An array of Strings to hold each row of the data file:
String [] lightData;
// -- A 2D array of floating point numbers to hold each data item in a separate array element
float [][] data;  // <-- first dimension is row of spreadsheet, second is column, items will be floats (numbers) this time
 
float lightSize=40; // <-- determines the sizes of the marks used to represent data items
float lightMax=100; // <-- determines the scaling of the marks used to represent data items
 
void setup () {
 
  // -- Configure sizings and modes:
  size(620, 220);
  textAlign(RIGHT);
  textSize(int(lightSize/2));
  ellipseMode(CENTER);
 
  // -- load the data from the file into an array of Strings with loadStrings():
  lightData = loadStrings("trafficLights.numbers.csv");
 
  // -- initialise the data array, our array of floats, to contain an array for each line of the data file:
  data = new float [lightData.length][];
 
  // -- loop through each line of our data array in turn:
  for (int i=0; i< lightData.length; i++) {
 
    // -- a local variable (an array of Strings) into which we put the output of split():
    String [] dataItems = split(lightData[i], ","); // <-- splitting the line at each comma
 
    // -- we need to initialise each element of the data array now we know how many items are in the line:
    data [i] = new float [dataItems.length];
 
    // -- loop through each comma separated item in the line, convert String to float and put each data item into the appropriate array element:
    for (int d=0; d< dataItems.length; d++) {
      float f = float(dataItems[d]);  // <-- convert tokens (String) into a number (float) 
       
      // -- Check whether the float conversion performed by float() has worked? 
      if (Float.isNaN(f)) {
        f = -1;    // <-- if 'f' is NotANumber (NaN), store '-1' to record this in our array of floats
      }
      // -- assign the value of 'f' to the current position in our data array of floats:
      data[i][d] = f ; // <-- 'i' is the data line (row), 'd' is the data element number (column) - store 'f'!
    }
  }
}
 
void draw() {
 
  background(250);
 
  // -- Loop through each row in the data array in turn:
  for (int i=0; i<data.length; i++) {
 
    float x = lightSize*1.5;         // <-- x position of the data for this observation
    float y = lightSize+i*lightSize; // <-- y position of data for this row / day:
    String dayName = lightData[i].substring(0, 3); // <-- first three characters in each row of the String array is the name of the day
    color fillColour = color(255, 255, 255); // <-- colour to fill the marks
    fill(32, 128);
    text(dayName, lightSize*1.5, y);  // <-- add the name of the day at the start of each row
 
    // -- Loop through each column in this row of the data array in turn:
    for (int d=1; d<data[i].length; d++) {
      float light = data[i][d];   // <-- store data value from 2D array in local variable for clarity
      String lightText = "";      // <-- informative text to show in the tool-tip (mouseOver) feature
      float lightRadius = 10;     // <-- store the size of the circle
 
      // -- Check whether 'light' is a valid number, invalids are stored as '-1' above, only proceed if so:
      if (light >=0) {
 
        // -- Condition to set colour and text depending on data value:
        if (light == 0 ) {
          fillColour = color(32, 200, 32, 128);
          lightText = "Green";
        } else {
          fillColour = color(240, 64, 64, 100);
          lightText = "Red "+int(light);  // <-- add time to text for tool tip
          lightRadius = lightRadius + map(light, 0, 35, 0, lightMax);  // <-- scale radius size to target range based on value of light
        }
 
        x+=lightSize;     // <-- move the x position along by lightSize
 
        noStroke();
        fill(fillColour); // <-- use the colour determined in the conditions above
        circle (x, y, lightRadius*0.8); // <-- draw a circle for the light that is a bit less big than lightSize
 
        // -- tool-tip : if the mouse is in the circle, add emphasis and text:
        if (dist(mouseX, mouseY, x, y) < lightRadius*0.4) {
          noFill();
          stroke(240, 64, 64, 200);
          circle(x, y, lightRadius*0.8);
          fill(16, 200);
          text(lightText, mouseX, mouseY-10);
        }
      } else {
        // -- if the String to float covnersion didn't work, and we have stored '-1' in data[i][d] then report this in the console
        println(i,d,"Not a Number: ",data[i][d]);
      }
    } // <-- End of Column loop
  } // <-- End of Row loop
 
  noLoop();  //  <-- switch the draw() loop off to save resources
}
 
void mouseMoved () {
  loop();  //  <-- switch the draw() loop on when mouse is moved (for interaction).
}
 
void keyPressed() {
  // -- change the size of the light marks following taps of the < and > keys
  if (key == '>') {
    lightSize = lightSize * 1.1;
  }
  if (key == '<') {
    lightSize = lightSize / 1.1;
  }
 
  // -- change the scaling of the light marks following taps of the , and . keys
  if (key == '.') {
    lightMax = lightMax * 1.1;
  }
  if (key == ',') {
    lightMax = lightMax / 1.1;
  }
 
  loop();  //  <-- switch the draw() loop on when a key is pressed so that the canvas updates
}

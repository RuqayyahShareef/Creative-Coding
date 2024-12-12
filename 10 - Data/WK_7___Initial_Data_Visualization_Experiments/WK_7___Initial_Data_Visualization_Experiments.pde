// -- Global variables ...
// -- An array of Strings to hold each row of the data file:
String [] lightData;
// -- A 2D array of strings to hold each data item in a separate array element
String [][] data;  // <-- first dimension is row of spreadsheet, second is column
 
float lightSize=40*0.75; // <-- determines the sizes of the marks used to represent data items
void setup () {
 
    size(620*2, 220*8);
    textAlign(RIGHT);
    textSize(18);
    ellipseMode(CENTER);
 
    // -- load the data from the file into an array of Strings with loadStrings():
    lightData = loadStrings("trafficLights.big.csv");
 
    // -- initialise the data array, to contain an array for each line of the data file:
    data = new String [lightData.length][];
 
    // -- loop through each line of our data array in turn:
    for (int i=0; i< lightData.length; i++) {
 
        // -- a local variable (an array of Strings) into which we put the output of split():
        String [] dataItems = split(lightData[i], ","); // <-- splitting the line at each comma
 
        // -- we need to initialise each element of the data array now we know how many items are in the line:
        data [i] = new String [dataItems.length];
 
        // -- loop through each comma separated item in the line and put each data item into the appropriate array element:
        for (int d=0; d< dataItems.length; d++) {
         data[i][d] = dataItems[d]; // <-- 'i' is the data line (row), 'd' is the data element number (column)
        }
    }
}
void draw() {
 
    background(250);
 
    // -- Loop through each row in the data array in turn:
    for (int i=0; i<data.length; i++) {
     
        float x = lightSize*1.5;         // <-- x position of the data for this observation
        float y = lightSize+i*lightSize; // <-- y position of data for this row / day:
        String dayName = data[i][0];     // <-- first element in each row of the data array is the name of the day
        color fillColour = color(255, 255, 255); // <-- colour to fill the marks
        fill(32, 128);
        text(dayName, lightSize*1.5, y);  // <-- add the name of the day at the start of each row
     
        // -- Loop through each column in this row of the data array in turn:
        for (int d=1; d<data[i].length; d++) {
            boolean weHaveData = true;  // <-- note whether each String is a valid data item - assume so at outset
            String light = data[i][d];  // <-- store data value from 2D array in local variable for clarity
            String lightText = "";     // <-- text to show in the mouseOver feature
         
            // -- Condition to set colour and text depending on data value:
            if (light.equals("G")) {    // <-- use the .equals() method of a String to check its contents
                fillColour = color(32, 200, 32, 128);
                lightText = "Green";
            } else if (light.equals("A")) {
                fillColour = color(255, 160, 32);
                lightText = "Amber";
            } else if (light.equals("R")) {
                fillColour = color(240, 64, 64);
                lightText = "Red";
            } else {
                weHaveData = false;  // <-- if not "R", "G" or "A", note that this String is not a valid data item
            }
         
            // -- only draw a light on the canvas if we have a String that is "R", "G" or "A".
            if (weHaveData) {
                x+=lightSize;                 // <-- move the x position along by lightSize
         
                noStroke();
                fill(fillColour); // <-- use the colour determined in the conditions above
                circle (x, y, lightSize*0.8); // <-- draw a circle for the light that is a bit less big than lightSize
         
                // -- if the mouse is in the circle, add emphasis and text:
                if (dist(mouseX, mouseY, x, y) < lightSize*0.4) {
                    stroke(32, 128);
                    circle(x, y, lightSize*0.9);
                    fill(16, 200);
                    text(lightText, mouseX, mouseY-10);
                }
            }
        } // <-- End of Column loop
    } // <-- End of Row loop
     
    noLoop();  //  <-- switch the draw() loop off to save resources
}
void mouseMoved () {
    loop();  //  <-- switch the draw() loop on when mouse is moved (for interaction).
}
     
void keyPressed() {
    // -- change the size of the light marks following clicks of the < and > keys
    if (key == '>') {
        lightSize = lightSize * 1.1;
    }
    if (key == '<') {
        lightSize = lightSize / 1.1;
    }
     
    loop();  //  <-- switch the draw() loop on when a key is pressed so that the canvas updates
}

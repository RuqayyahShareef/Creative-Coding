void setup(){
  size(800,400);
  background(253, 31, 0);
  // Set frame rate to 1 frame per second (to mimic how seconds pass).
  frameRate(1);
}
void draw(){
  // Calculate values
  int hoursVal = frameCount/3600;
  int minutesVal = (frameCount%3600)/60;
  int secondsVal = frameCount%60;
  
  // Format: nf(number,digits);
  String hours = nf(hoursVal,2);
  String minutes = nf(minutesVal,2);
  String seconds = nf(secondsVal,2);
  
  // Form clock display
  String time = (hours +" : "+ minutes+" : "+seconds);
  
  // Draw digital clock
  rectMode(CENTER);
  fill(0,0,255);
  rect(width/2, height/2, 700, 300);
  fill(248);
  rect(width/2, height/2, 625, 225);
  
  // Text in the rectangle
  textSize(100);
  fill(0);
  textAlign(CENTER, CENTER);
  text(time,width/2, height/2);
  
  
  
}

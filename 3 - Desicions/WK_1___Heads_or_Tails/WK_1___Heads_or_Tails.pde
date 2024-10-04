// Modify the code so that the message is TAILS if the number is less than 1 and HEADS otherwise.

float randomNumber;
 
void setup()
{
  size(200, 200);
  fill(0);
  textSize(48);
  textAlign(CENTER);
 
  // Initialise randomNumber between 0 and 2
  randomNumber = random(2);
}
 
void draw()
{
  background(230, 255, 230);
  String message;
  if (randomNumber < 1){
    message = "TAILS";
  }
  else {
    message = "HEADS";
  }

  text(message, width/2, height/2);
}

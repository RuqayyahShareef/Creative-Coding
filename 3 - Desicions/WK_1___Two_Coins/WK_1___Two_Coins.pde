float randomNumber, randomNumber2;
 
void setup()
{
  size(200, 200);
  fill(0);
  textSize(30);
  textAlign(CENTER);
  
  //-- Generate 2 random numbers
  randomNumber = random(2.0);
  randomNumber2 = random(2.0);
}
 
void draw()
{
  background(230, 255, 230);
 
  String message;
  if (randomNumber < 1.0 && randomNumber2 < 1.0) {
    message = "TWO TAILS";
  } else if (randomNumber < 1.0 || randomNumber2 < 1.0){
    message = "MIXED";
  } else {
    message = "TWO HEADS";
  }
  text(message, width/2, height/2); //-- Display text on canvas.
}

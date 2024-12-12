void setup()
{
  size(600, 600);
}
 
void draw()
{
  background(255);
  stroke(32);
  noFill();
 
  float xPos   = 100;
  float yPos   = 100;
  float sSize  = 100;
  
  //randomSeed(123456); // stops it flashing but keeps it random
  
  for (int i = 0; i<100; i++){
    //vQuad(xPos, yPos, sSize*random(0,5),5);
    //vQuad(xPos+100, yPos, sSize/2,50);
    //vQuad(xPos+200, yPos, sSize/2,1);
    
    vQuads(xPos, yPos, sSize, 5,1);
  }
 
  
}
void vQuads(float xPos, float yPos, float sSize, int r, int s){
  for (int i=0;i<s; i++){
    float qs = map(i,0,s-1,sSize*0.2, sSize);
    vQuad(xPos, yPos, qs, r);
  }
  

}
void vQuad(float xPos, float yPos, float s, int r){
  float sHalf = s/2;
    quad(
  // -- add the eight arguments here ...
  xPos - sHalf+random(-r,r), yPos - sHalf,
  xPos + sHalf+random(-r,r), yPos - sHalf,
  xPos + sHalf+random(-r,r), yPos + sHalf,
  xPos - sHalf+random(-r,r), yPos + sHalf);
}

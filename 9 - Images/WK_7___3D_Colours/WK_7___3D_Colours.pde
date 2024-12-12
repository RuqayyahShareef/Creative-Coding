float[][][] colours;      // Declare a 3D array of floats
 
void setup()
{
  size(800,800);
  fill(180,50,50,100);
  noStroke();
 
  colours = new float[100][100][3];
  for (int row=0; row<100; row++)
  {
    for (int col=0; col<100; col++)
    {
      for (int k=0; k<3; k++){
      colours[row][col][k] = random(255);
      }
    }
  }
}
 
void draw()
{
  background(255);
 
  for (int row=0; row<100; row = row+1)
  {
    for (int col=0; col<100; col = col+1)
    {
      circle(col*8, row*8,colours[row][col][0]);
    }
  }
}

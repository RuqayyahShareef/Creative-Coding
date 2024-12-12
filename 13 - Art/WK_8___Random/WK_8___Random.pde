
float x;

void setup(){
  size(800,100);
}

void draw(){
  // global float 'x' that increases twice w framecount and constrain x to the range 0-width
  x = 2*frameCount%width;
  circle(x,height/2 +random(-height/2,height/2),15);
  println(x);
} 

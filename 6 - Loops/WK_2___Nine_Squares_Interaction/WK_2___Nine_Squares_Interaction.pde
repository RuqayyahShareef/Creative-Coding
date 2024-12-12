void setup(){
  size(1000, 400);
}

void draw(){
  for (int i=0; i<5; i++){
    
    /*
    create more or fewer rectangles: change the upper bound of i - e.g. i<4
    draw them towards the left or towards the right of the sketch: change the value of the OFFSET part of the rect x-coord parameter
    space them further apart or closer together: change the value of the additional multiplier part of the x-coord parameter.
    make them increasingly larger in size: multiplier on the rect size parameters.
    make every alternate rectangle red: use if statement to check value of i.
*/
    rect(80 + i*150, 50, i*50,i*50);
    if (i%2 == 1){
      fill(255,0,0);
    }
    else{
      fill(255);
    }
  }
}

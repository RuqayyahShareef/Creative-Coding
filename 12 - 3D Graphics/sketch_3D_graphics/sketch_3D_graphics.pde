// 3D images
// processing assumes you are doing 2D so you need to specify 3D system of reference using P3D parameter when creating canvas.
void setup(){
  size(600,600,P3D);
  //noStroke();
  
}

void draw(){
  background(0);
  translate(width/2, height/2);
  rotateX(mouseX); // can convert to radians to make the rotation genteler.
  sphere(200); // doesnt accept coordinate location as parameter
  // 200 is the radius.
  // so we have to translate it (as we have to do w/ all 3D shapes).
  
  
  // make sphere rotate with special functions: rotateX(), rotateY(), rotateZ()
  
  // can also translate in z coord (moving the sys of ref TOWARDS YOU (positive translation)).
  
  //translate(0,0,frameCount*220);?? doesnt work
  
}

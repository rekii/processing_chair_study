import controlP5.*;

final float X_HEIGHT = 150;
float backgroundWhiteness = 0;

int chair_num = 1;
Chair[] chairs = new Chair[chair_num];

boolean showCube = true;

// ------ mouse interaction ------
int offsetX = 0, offsetY = 0, clickX = 0, clickY = 0, zoom = -100;
float rotationX = 0, rotationY = 0, targetRotationX = PI/12, targetRotationY = PI/6, clickRotationX, clickRotationY; 
float spaceSizeX = X_HEIGHT * 2, spaceSizeY = X_HEIGHT * 2, spaceSizeZ = X_HEIGHT * 2;

void setup() {
  size (800, 800, P3D);
  
  for (int i = 0; i < chair_num; i++){
     //chairs[i] = new Chair (random(-spaceSizeX / 2, spaceSizeX / 2), 
     // random(-spaceSizeY / 2, spaceSizeY / 2),
     // random(-spaceSizeZ / 2, spaceSizeZ / 2));
     chairs[i] = new Chair (0, 0, 0);
  }
  
  smooth(8);
}

void draw() {
  ortho();
  background (255);
  
  //lights();
  
  pushMatrix(); 
  // ------ set view ------
  translate(width/2, height/2, zoom); 

  if (mousePressed && mouseButton==RIGHT) {
    offsetX = mouseX-clickX;
    offsetY = mouseY-clickY;
    targetRotationX = min(max(clickRotationX + offsetY/float(width) * TWO_PI, -HALF_PI), HALF_PI);
    targetRotationY = clickRotationY + offsetX/float(height) * TWO_PI;
  }
  rotationX += (targetRotationX-rotationX)*0.25; 
  rotationY += (targetRotationY-rotationY)*0.25;  
  rotateX(-rotationX);
  rotateY(rotationY); 

  noFill();
  stroke(55,100);
  
  if (showCube) {
    box(spaceSizeX * 1.1, spaceSizeY * 1.1, spaceSizeZ * 1.1);
  }
  
  for (int i = 0; i < chair_num; i++){
    chairs[i].draw();
  }
  
  popMatrix();
}
// ------ interactions ------
void keyPressed() {
  if (keyCode == UP) zoom += 1;
  if (keyCode == DOWN) zoom -= 1;
  if (keyCode == LEFT) zoom += 20;
  if (keyCode == RIGHT) zoom -= 20;
  if (key == 'c') showCube = !showCube;
  if (key == 's') saveFrame("fav_####.png");
}

void mousePressed(){
  clickX = mouseX;
  clickY = mouseY;
  clickRotationX = rotationX;
  clickRotationY = rotationY;
}

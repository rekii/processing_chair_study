class Chair {
  PVector pos;
  int size = 100; // X Height of the chair
  int weight = 10;
  
  Chair (float x, float y, float z) {
    pos = new PVector(x, y, z);
  }
  
  void draw () {
    // 
    pushStyle();
    
    fill (0);
    stroke(0);
    strokeWeight(weight);
    // strokeCap(ROUND);
    strokeJoin(MITER);

    pushMatrix();
      translate(pos.x, pos.y, pos.z);
      pushMatrix();
      rotateX(PI / 2);
      rect(-size / 2, -size / 2, size, size );
    popMatrix();

    beginShape();
      vertex(-size / 2, -size / 2, -size / 2);
      vertex(size / 2, -size / 2, -size / 2);
      vertex(size / 2, -size, -size / 2);
      vertex(-size / 2, -size, -size / 2);
      vertex(-size / 2, -size / 2, -size / 2);

    endShape();

    popStyle();

    // legs
    pushStyle();
    stroke(0);
    strokeWeight(weight);
    strokeCap(ROUND);

    beginShape(LINES);
      vertex(-size / 2, 0, -size / 2);
      vertex(-size / 2, -size, -size / 2);

      vertex(size / 2, 0, -size / 2);
      vertex(size / 2, -size, -size / 2);

      vertex(-size / 2, 0, -size / 2);
      vertex(-size / 2, size, -size / 2);

      vertex(size / 2, 0, -size / 2);
      vertex(size / 2, size, -size / 2);

      vertex(size / 2, 0, size / 2);
      vertex(size / 2, size, size / 2);

      vertex(-size / 2, 0, size / 2);
      vertex(-size / 2, size, size / 2);
    endShape();
    popStyle();

    popMatrix();
  }
}

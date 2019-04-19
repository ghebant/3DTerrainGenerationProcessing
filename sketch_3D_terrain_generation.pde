int cols, rows; //<>//
int scl = 20;

int w = 1200;
int h = 900;

float[][] terrain;

import queasycam.*;

QueasyCam cam;

void setup() {
  size(1200, 600, P3D);
  cols = w / scl;
  rows = h / scl;
  terrain = new float[cols][rows];
  //frameRate(1);
  cam = new QueasyCam(this);
  cam.speed = 5;              // default is 3
  cam.sensitivity = 0.5;
}

void draw() {
  background(0);
  stroke(255);
  
  float angle = map(mouseX, 0, 1200, -360, 360);
    //float angle2 = map(mouseY, 0, 1200, 0, 360);

  camera(0, 0, 120.0, angle, mouseY, 0.0, 0.0, 1.0, 0.0);
  println(mouseX);
  //noFill();
  //fill(random(255), random(255), random(255));
  translate(width/2, height/2);
  rotateX(PI/3);
  translate(-w/2, -h/2);
generateChunck();
  
}

void generateChunck() {
 float yoff = 0;
  for (int y = 0; y < rows; y++) {
    float xoff = 0;
    for (int x = 0; x < cols; x++) {
      terrain[x][y] = map(noise(xoff, yoff), 0, 1, -10, 10);
      xoff += 0.05;
    }
    yoff += 0.05;
  }

  for (int y = 0; y < rows-1; y++) {
    //beginShape(TRIANGLE_STRIP);
    for (int x = 0; x < cols; x++) {

      //vertex(x*scl, y*scl, terrain[x][y]);
      //vertex(x*scl, (y+1)*scl, terrain[x][y+1]);

      // push();
      //translate(x, y, terrain[x][y]);
      push();
      //fill(random(255), random(255), random(255));
      fill(0);

      //int z =  (int)random(0, 2)*scl;
      int z =  (int)terrain[x][y]*scl;

      translate(x*scl, y*scl, z);
      box(scl);
      pop();
      //println("X: " + x + " Y: " + y, " Z: " + z);
      //pop();
      //rect(x*scl, y*scl, scl, scl);
    }
    //endShape();
  } 
}

/**
 * Loop. 
 * 
 * If noLoop() is run in setup(), the code in draw() 
 * is only run once. In this example, click the mouse 
 * to run the loop() function to cause the draw() the 
 * run continuously. 
 */

int cols, rows;
int scl = 20;
int w = 5000;
int h = 5000;
float rotateSpeed; 
float flying = 0;

float[][] terrain;
// The statements in the setup() function 
// run once when the program begins
void setup() {
  size(600, 600, P3D);
  stroke(255);     // Set stroke color to white
  cols = w / scl;
  rows = h/ scl;
  terrain = new float[cols][rows];
}

void draw() { 
  background(0);
  stroke(255, 50);
  translate(600, 0, 0);
  rotateY(rotateSpeed * 0.05);
  fill(0, 0, 0);
  sphereDetail(500 / 4);
  sphere(200);
  rotateSpeed+= 0.05;
  flying -= 0.01;

  float yoff = flying;
  for (int y = 0; y < rows; y++) {
    float xoff = 0;
    for (int x = 0; x < cols; x++) {
      terrain[x][y] = map(noise(xoff, yoff), 0, 1, -100, 100);
      xoff += 0.2;
    }
    yoff += 0.2;
  }
  translate(width/2, height/2+50);
  rotateX(PI/3);
  translate(-w/2, -h/2);
  for (int y = 0; y < rows-1; y++) {
    beginShape(TRIANGLE_STRIP);
    for (int x = 0; x < cols; x++) {
      vertex(x*scl, y*scl, terrain[x][y]);
      vertex(x*scl, (y+1)*scl, terrain[x][y+1]);
      //rect(x*scl, y*scl, scl, scl);
    }
    endShape();  
  } 
}

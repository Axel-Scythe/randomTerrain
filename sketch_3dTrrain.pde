int rows, columns;
int scale = 20;
int h = 2000;
int w = 1500;
int size = 1000;
int sizeScale;

float flying = 0;

float[][] terrain;


void setup() {
  size(1000, 1000, P3D);

  rows = h / scale;
  columns = w / scale;

  terrain = new float [columns][rows];
  sizeScale = size/4;
}


void draw() {

  lightSpecular(150, 100, 50);
  directionalLight(255, 255, 255, -1, 0, 0);

  flying -= 0.05;
  float yoff = flying;
  for (int y = 0; y < rows; y++) {
    float xoff = 0;
    for (int x = 0; x < columns; x++) {
      terrain[x][y] = map(noise(xoff, yoff), 0, 1, -100, 75);
      xoff += 0.1;
    }
    yoff += 0.1;
  }

  ambientLight(126, 126, 126);
  background(100, 100, 150);
  noStroke();
  fill(50, 100, 25);

  translate(width/2, height/2 - sizeScale + 50);
  rotateX(PI/3);
  translate(-w/2, -h/2);

  for (int y = 0; y < rows-1; y++) {
    beginShape(TRIANGLE_STRIP);
    for (int x = 0; x < columns; x++) {
      vertex(x*scale, y*scale, terrain[x][y]);
      vertex(x*scale, (y+1)*scale, terrain[x][y+1]);
    }
    endShape();
  }

  translate(0, 0, -20);

  fill(0, 50, 255, 100);
  for (int y = 0; y < rows; y++) {
    for (int x = 0; x < columns; x++) {
      // shininess(100);
      // specular(100,100,100);
      rect(x*scale, y*scale, scale, scale);
    }
  }
}
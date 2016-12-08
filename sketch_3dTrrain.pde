int rows, columns;
int scale = 20;
int h = 600;
int w = 600;
int size = 500;
int sizeScale;

float flying = 0;

float[][] terrain;

void setup() {
  size(500, 500, P3D);

  rows = h / scale;
  columns = w / scale;

  terrain = new float [columns][rows];
  sizeScale = size/4;
}


void draw() {

  flying -= 0.1;

  float yoff = flying;
  for (int y = 0; y < rows; y++) {
    float xoff = 0;
    for (int x = 0; x < columns; x++) {
      terrain[x][y] = map(noise(xoff, yoff), 0, 1, -100, 100);
      xoff += 0.1;
    }
    yoff += 0.1;
  }

  scale(2);
  background(0);
  stroke(255);
  fill(50, 100, 25);

  translate(width/2 - sizeScale, height/2 - sizeScale);
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
}
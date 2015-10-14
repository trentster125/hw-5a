# hw-5a

class Ball {
  float x, y;
  float vx, vy;
  float size = 10;
  float c;

  Ball(float x, float y, float c) {
    this.x = x;
    this.y = y;
    this.c = c;
    vx = random(1);
    vy = random(1);
  }

  void draw() {
    noStroke();
    fill(c,255,255);
    ellipse(x, y, size*2, size*2);
  }

  void move() {
    x += vx;
    y += vy;
    if (x < size || x > width-size) {
      vx = -vx;
    }
    if (y < size || y > height-size) {
      vy = -vy;
    }
  }
}

ArrayList<Ball> list;

void setup() {
  size(500, 500);
  float c = 1;
  colorMode(HSB);

  list = new ArrayList<Ball>();

  for (int x = 20; x < width-20; x += 20) {      
    for (int y = 20; y < height-20; y += 20) {
      list.add(new Ball(x, y, c));
      c = c+.5;
    }    
  }
}

void draw() {
  background(255);

  for (int i = 0; i < list.size(); i += 1) {
    list.get(i).draw();
    list.get(i).move();    
  }
}

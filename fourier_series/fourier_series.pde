import java.util.ArrayList;
import java.util.List;

final int WIDTH = 2000; // display width
final int HEIGHT = 1200; // display height
final int PERIOD = 25; // the period of rotation
final int LOOP_NUM = 5;
final int INIT_RADIUS = 150; // the radius of the biggest circle
final int NUM = 200; // the number of circles
final float OFFSET = 20;
final float SCALE = 0.5;
final float TIME_SCALE = 5;

final int interval = 10; // rendering interval
int time = 0; // global time

Locus locus0 = new Locus();
Locus locus1 = new Locus();

void setup() {
 size(1000, 600);
 noLoop();
}
void draw() {
  scale(SCALE);
  background(#FFFFFF);
  
  FourierCircle c0 = new SquareWave(WIDTH / 2, HEIGHT / 4, 1, time / interval, INIT_RADIUS);
  FourierCircle c1 = new TriangleWave(WIDTH / 2, 3 * HEIGHT / 4, 1, time / interval, INIT_RADIUS);
  
  /* draw Y axis */
  stroke(0);
  line(100, OFFSET, 100, HEIGHT / 2 - OFFSET);
  line(100, HEIGHT / 2  + OFFSET, 100, HEIGHT - OFFSET);
  render(c0, locus0);
  render(c1, locus1);
  
  if(time / interval < PERIOD * LOOP_NUM) time++;
  else noLoop();
}

/* Event handler */
void mousePressed(){
  time = 0;
  locus0.clear();
  locus1.clear();
  loop();
}
void render(FourierCircle c, Locus locus) {
  /* render the root circle */
  Circles circles = new Circles(c, NUM);
  circles.generate();
  
  /* Draw red lines */
  FourierCircle last = circles.last;
  strokeWeight(3);
  stroke(#FF0000);
  line(last.cx, last.cy , 100 + TIME_SCALE * time / interval, last.cy);
  
  /* lender the wave */
  locus.addPoint(new Point(100 + TIME_SCALE * time / interval, last.cy));
  locus.draw();
  
  circles.draw();
}
class Point {
  float x,y;
  public Point(float x, float y) {
    this.x = x;
    this.y = y;
  }
}

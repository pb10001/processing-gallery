import java.util.ArrayList;
import java.util.List;

final int PERIOD = 1000; // the period of rotation
final int LOOP_NUM = 1;
final int INIT_RADIUS = 150; // the radius of the biggest circle
final int NUM = 20; // the number of circles
final float OFFSET = 20;
final float SCALE = 0.5;
final float TIME_SCALE = 5;
final float A = 0.7;
final float B = 5;

final int interval = 10; // rendering interval
int time = 0; // global time

Locus locus0 = new Locus();
Locus locus1 = new Locus();

void setup() {
 size(1000, 600);
 noLoop();
}
void draw() {
  translate(0, height);
  rotate(-PI/2);
  scale(0.5);
  background(#FFFFFF); 
  drawXAxis();
  FourierCircle c0 = new WeierstrassCircle(width / 2, height, 1, time / interval, INIT_RADIUS, PERIOD);
  render(c0, locus0);
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
void drawXAxis(){
  /* draw Y axis */
  stroke(0);
  strokeWeight(3);
  line(OFFSET, 100, height * 2 - OFFSET, 100);
}
void render(FourierCircle c, Locus locus) {
  /* render the root circle */
  Circles circles = new Circles(c, NUM);
  circles.generate();
  
  /* Draw red lines */
  FourierCircle last = circles.last;
  strokeWeight(3);
  stroke(#0000FF);
  line(last.getCx(), last.getCy() , last.getCx(), 100 + TIME_SCALE * time / interval);
  
  /* lender the wave */
  locus.addPoint(new Point(last.getCx(), 100 + TIME_SCALE * time / interval));
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

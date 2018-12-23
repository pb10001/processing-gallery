import java.util.ArrayList;
import java.util.List;

final int WIDTH = 2000; // display width
final int HEIGHT = 1200; // display height
final int PERIOD = 100; // the period of rotation
final int LOOP_NUM = 5;
final int R0 = 200; // the radius of the biggest circle
final int NUM = 200; // the number of circles
final float OFFSET = 20;
final float SCALE = 0.5;

final int interval = 5; // rendering interval
int time = 0; // global time

List<Point> locus0 = new ArrayList<Point>();
List<Point> locus1 = new ArrayList<Point>();

void setup() {
 size(1000, 600);
}

void draw() {
  scale(SCALE);
  background(#FFFFFF);
  
  if(time / interval < PERIOD * LOOP_NUM) time++;
  else noLoop();
  
  FourierCircle c0 = new SquareWave(WIDTH / 2, HEIGHT / 4, 1, time / interval);
  FourierCircle c1 = new TriangleWave(WIDTH / 2, 3 * HEIGHT / 4, 1, time / interval);
  
  /* draw Y axis */
  stroke(0);
  line(100, OFFSET, 100, HEIGHT / 2 - OFFSET);
  line(100, HEIGHT / 2  + OFFSET, 100, HEIGHT - OFFSET);
  render(c0, locus0);
  render(c1, locus1);
}
void render(FourierCircle c, List<Point> locus) {
  /* render the root circle */
  stroke(0);
  strokeWeight(1);
  c.draw();
  FourierCircle tmp = c;
  
  /* render the child circles */
  for(int i=0; i < NUM; i++){
    tmp = tmp.getChild();
    tmp.draw();
  }
  strokeWeight(3);
  stroke(#FF0000);
  line(tmp.cx, tmp.cy, 100 + time / interval, tmp.cy);
  locus.add(new Point(100 + time / interval, tmp.cy));
  
  /* lender the wave */
  beginShape();
  stroke(#0000FF);
  for(Point p: locus) {
    p.draw();
  }
  endShape();
}
void mousePressed(){
  time = 0;
  locus0.clear();
  locus1.clear();
  loop();
}
class Point {
  float x,y;
  public Point(float x, float y) {
    this.x = x;
    this.y = y;
  }
  void draw() {
    vertex(x, y);
  }
}
abstract class FourierCircle {
  float cx, cy, r, n, px, py;
  int time;
  public FourierCircle(float cx, float cy, float n ,int time) {
    this.cx = cx;
    this.cy = cy;
    this.n = n;
    r = R0 / denominator(n);
    this.time = time;
    
    px = this.cx + sign(n) * r * cos(2 * PI * numerator(n) * time / PERIOD);
    py = this.cy + sign(n) * r * sin(2 * PI * numerator(n) * time / PERIOD);
  }
  public void draw(){
    ellipse(this.cx, this.cy, 2 * r, 2 * r);
    line(this.cx, this.cy, px, py);
    stroke(0);
    noFill();
  }
  /* abstract methods */
  public abstract float sign(float n);
  public abstract float numerator(float n);
  public abstract float denominator(float n);
  public abstract FourierCircle getChild();
}
class SquareWave extends FourierCircle{
  /* square wave */
  public SquareWave(float cx, float cy, float n ,int time) {
    super(cx, cy, n , time);
  }
  public float sign(float n) {
    return 1;
  }
  public float numerator(float n) {
    return 2 * n - 1;
  }
  public float denominator(float n) {
    return 2 * n - 1;
  }
  public SquareWave getChild() {
    return new SquareWave(px, py, n + 1 ,this.time);
  }
}
class TriangleWave extends FourierCircle {
  /* triangle wave */
  public TriangleWave(float cx, float cy, float n ,int time) {
    super(cx, cy, n , time);
  }
  public float sign(float n) {
    return n % 2 == 0 ? 1: -1;
  }
  public float numerator(float n) {
    return 2 * n - 1;
  }
  public float denominator(float n) {
    return (2 * n - 1) * (2 * n - 1);
  }
  public TriangleWave getChild() {
    return new TriangleWave(px, py, n + 1 ,this.time);
  }
}

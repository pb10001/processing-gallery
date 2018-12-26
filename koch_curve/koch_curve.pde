import java.util.*;

final int INTERVAL = 100;
int time = 0;
ArrayList<Koch> kochs = new ArrayList<Koch>();
void setup() {
  size(500,500);
  kochs.add(new Koch(900, 250, 100, 250));
  kochs.add(new Koch(100, 250, 500, 250 + 400 * sqrt(3)));
  kochs.add(new Koch(500, 250 + 400 * sqrt(3), 900, 250));
  noLoop();
}
void draw() {
  scale(0.5);
  background(#FFFFFF);
  ArrayList<Koch> tmp = new ArrayList<Koch>();
  if(time < 600) time++;
  else noLoop();
  for(Koch c: kochs) {
    line(c.x1,c.y1,c.x2,c.y2);
    if(time % INTERVAL > 0) continue;
    for(Koch g: c.getChildren()){
      tmp.add(g);
    }
    kochs = tmp;
  }
}
void mousePressed() {
  time = 0;
  kochs.clear();
  kochs.add(new Koch(900, 250, 100, 250));
  kochs.add(new Koch(100, 250, 500, 250 + 400 * sqrt(3)));
  kochs.add(new Koch(500, 250 + 400 * sqrt(3), 900, 250));
  loop();
}
class Koch {
  public Koch(float x1, float y1, float x2, float y2) {
    this.x1 = x1;
    this.y1 = y1;
    this.x2 = x2;
    this.y2 = y2;
  }
  public float x1, y1, x2, y2;
  public ArrayList<Koch> getChildren() {
    ArrayList<Koch> res = new ArrayList<Koch>();
    float p1x = (2 * x1 + x2) / 3;
    float p1y = (2 * y1 + y2) / 3;
    Koch k1 = new Koch(x1, y1, p1x, p1y);
    
    float p2x = x1 + (x2 - x1) / 2 - sqrt(3) * (y2 - y1) / 6;
    float p2y = y1 + (y2 - y1) / 2 + sqrt(3) * (x2 - x1) / 6;  
    
    Koch k2 = new Koch(p1x, p1y, p2x, p2y);
    res.add(k1);
    res.add(k2);
    float p3x = (2 * x2 + x1) / 3;
    float p3y = (2 * y2 + y1) / 3;
    
    Koch k3 = new Koch(p2x, p2y, p3x, p3y);
    Koch k4 = new Koch(p3x, p3y, x2, y2);
    res.add(k3);
    res.add(k4);
    
    return res;
  }
}

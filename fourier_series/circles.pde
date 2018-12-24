import java.util.ArrayList;
import java.util.List;

class Circles implements Drawable {
   public Circles(FourierCircle root, int num) {
     this.root = root;
     this.num = num;
   }
   int num;
   FourierCircle root;
   FourierCircle last;
   List<FourierCircle> circles = new ArrayList<FourierCircle>();
   public void add(FourierCircle c) {
     circles.add(c);
   }
   public void clear() {
     circles.clear();
   }
   public void draw() {
    stroke(0);
    strokeWeight(1);
    noFill();
     for(FourierCircle c: circles) {
        ellipse(c.cx, c.cy, 2 * c.r, 2 * c.r);
        line(c.cx, c.cy, c.px, c.py);
     }
   }
  public void generate() {
    circles.clear();
    FourierCircle tmp = root;
    circles.add(root);
    for(int i=0; i < NUM; i++){
      tmp = tmp.getChild();
      circles.add(tmp);
    }
    last = tmp;
  } 
}

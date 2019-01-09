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
    strokeWeight(1);
    noFill();
     for(FourierCircle c: circles) {
        stroke(0);
        ellipse(c.getCx(), c.getCy(), 2 * c.getR(), 2 * c.getR());
        stroke(#FF0000);
        line(c.getCx(), c.getCy(), c.getPx(), c.getPy());
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

import java.util.ArrayList;
import java.util.List;

class Locus implements Drawable {
  public Locus() {
  }
  List<Point> points = new ArrayList<Point>();
  public void addPoint(Point p) {
    points.add(p);
  }
  public void clear() {
    points.clear();
  }
  public void draw() {
    beginShape();
    stroke(#0000FF);
    strokeWeight(.3);
    for(Point p: points) {
      vertex(p.x, p.y);
    }
    endShape();
  }
}

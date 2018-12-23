import java.util.ArrayList;
import java.util.Iterator;
import java.util.List;
import java.util.Collections;

/* constant values */
final int speed = 10;
final float radius = 5;
final int initLife = 150;
final float dumping = 0.97;

Boolean pressing = false;
List<Wave> waves = new ArrayList<Wave>();//list of particles

void setup(){
  size(1000, 600);
  frameRate(30);
}
void draw(){
  background(0);
  List<Wave> rm = new ArrayList<Wave>();
  for(Wave w: waves){
    w.grow();
    Boolean res = w.draw();
    if(!res){
      rm.add(w);
    }
  }
  for(Wave w: rm){
    waves.remove(w);
  }
  if(pressing){
    Wave w =new Wave(mouseX, mouseY, initLife);
    waves.add(w);
  }
}
void mousePressed(){
  pressing ^= true;
}
class Wave{
  public Wave(float x, float y, int life){
    this.x = x;
    this.y = y;
    this.life = life;
    this.radius = 0;
    opacity = 255;
    setColor(255,255,255);
  }
  float x,y;
  float r,g,b;
  float radius;
  float opacity;
  Boolean canGenerate = true;
  int life;
  void grow(){
    radius+= speed;
    life--;
    opacity *= dumping;
  }
  Boolean draw(){
    if(life <= 0){
      return false;
    }
    strokeWeight(speed/4);
    stroke(r,g,b,opacity);
    fill(0,0,0,0);
    ellipse(x,y,radius,radius);
    return true;
  }
  void setColor(float r, float g, float b){
    this.r = r;
    this.g = g;
    this.b = b;
  }
}

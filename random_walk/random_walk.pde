import java.util.ArrayList;
import java.util.Iterator;
import java.util.List;
import java.util.Collections;

/* constant values */
final int num = 10;
final int speed = 5;
final float opacity = 128;
final float radius = 5;
final int initLife = 1000;


List<Particle> particles = new ArrayList<Particle>();//list of particles

void setup(){
  size(600, 600);
}
void draw(){
  background(0);
  List<Particle> tmp = new ArrayList<Particle>();
  List<Particle> rm = new ArrayList<Particle>();
  for(Particle p: particles){
    Boolean res = p.draw();
    Particle q = p.walk();
    if(q != null)
      tmp.add(q);
    if(!res)
      rm.add(p);     
  }
  for(Particle p: tmp){
    particles.add(p);
  }
  for(Particle p: rm){
    particles.remove(p);
  }
}
void mouseClicked(){
  Particle p =new Particle(mouseX, mouseY, initLife);
  particles.add(p);
}
class Particle{
  public Particle(float x, float y, int life){
    this.x = x;
    this.y = y;
    this.life = life;
    setColor(random(255), random(255), random(255));
  }
  float x,y;
  float r,g,b;
  Boolean canGenerate = true;
  int life;
  Particle walk(){
    if(life > 0) life--;
    if(!canGenerate) return null;
    canGenerate = false;
    Particle p = new Particle(x+speed*2*(floor(random(2))-0.5), y+speed*2*(floor(random(2))-0.5), life);
    p.setColor(r,g,b);
    return p;
  }
  Boolean draw(){
    if(life <= 0){
      return false;
    }
    stroke(r,g,b,opacity);
    fill(r,g,b, opacity);
    ellipse(x,y,radius,radius);
    return true;
  }
  void setColor(float r, float g, float b){
    this.r = r;
    this.g = g;
    this.b = b;
  }
}

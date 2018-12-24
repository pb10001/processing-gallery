abstract class FourierCircle {
  public final float size;
  protected float  n, period;
  private float cx, cy, r, px, py;
  int time;
  public FourierCircle(float cx, float cy, float n ,int time, float size, float period) {
    this.cx = cx;
    this.cy = cy;
    this.n = n;
    this.size = size;
    this.r = size * r0() / radiusRatio();
    this.time = time;
    this.period = period;
    this.px = this.cx + r * cos(2 * PI * freqRatio() * time / period);
    this.py = this.cy + r * sign() * sin(2 * PI * freqRatio() * time / period);
    
  }
  public float getCx() { return cx; }
  public float getCy() { return cy; }
  public float getR() { return r; }
  public float getPx() { return px; }
  public float getPy() { return py; }
  /* abstract methods */
  public abstract float r0();
  public abstract float sign();
  public abstract float freqRatio();
  public abstract float radiusRatio();
  public abstract FourierCircle getChild();
}

abstract class FourierCircle {
  final float R0;
  float cx, cy, r, n, px, py;
  int time;
  public FourierCircle(float cx, float cy, float n ,int time, float r) {
    this.cx = cx;
    this.cy = cy;
    this.n = n;
    this.R0 = r;
    this.r = r * r0() / radiusRatio(n);
    this.time = time;
    
    px = this.cx + this.r * cos(2 * PI * freqRatio(n) * time / PERIOD);
    py = this.cy + sign(n) * this.r * sin(2 * PI * freqRatio(n) * time / PERIOD);
  }
  /* abstract methods */
  public abstract float r0();
  public abstract float sign(float n);
  public abstract float freqRatio(float n);
  public abstract float radiusRatio(float n);
  public abstract FourierCircle getChild();
}

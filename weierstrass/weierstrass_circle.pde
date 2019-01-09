
class WeierstrassCircle extends FourierCircle {
  final float A = 0.7;
  final float B = 5;
  /* square wave */
  public WeierstrassCircle(float cx, float cy, float n ,int time, float r, float period) {
    super(cx, cy, n , time, r, period);
  }
  public float r0() {
    return 1;
  }
  public float sign() {
    return 1;
  }
  public float freqRatio() {
    return (float) Math.pow(B, n) / 2.0;
  }
  public float radiusRatio() {
    return (float) (1.0 / Math.pow(A, n));
  }
  public WeierstrassCircle getChild() {
    WeierstrassCircle c = new WeierstrassCircle(getPx(), getPy(), n + 1 ,this.time, size, period);
    return c;
  }
}

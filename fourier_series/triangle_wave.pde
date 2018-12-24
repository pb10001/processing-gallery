class TriangleWave extends FourierCircle {
  /* triangle wave */
  public TriangleWave(float cx, float cy, float n ,int time, float r, float period) {
    super(cx, cy, n , time, r, period);
  }
  public float r0() {
    return 8 / PI / PI;
  }
  public float sign() {
    return n % 2 == 1 ? 1: -1;
  }
  public float freqRatio() {
    return 2 * n - 1;
  }
  public float radiusRatio() {
    return (2 * n - 1) * (2 * n - 1);
  }
  public TriangleWave getChild() {
    return new TriangleWave(getPx(), getPy(), n + 1 ,this.time, size, period);
  }
}

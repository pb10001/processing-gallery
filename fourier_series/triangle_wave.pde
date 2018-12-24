class TriangleWave extends FourierCircle {
  /* triangle wave */
  public TriangleWave(float cx, float cy, float n ,int time, float r) {
    super(cx, cy, n , time, r);
  }
  public float r0() {
    return 8 / PI / PI;
  }
  public float sign(float n) {
    return n % 2 == 1 ? 1: -1;
  }
  public float freqRatio(float n) {
    return 2 * n - 1;
  }
  public float radiusRatio(float n) {
    return (2 * n - 1) * (2 * n - 1);
  }
  public TriangleWave getChild() {
    return new TriangleWave(px, py, n + 1 ,this.time, R0);
  }
}

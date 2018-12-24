class SquareWave extends FourierCircle {
  /* square wave */
  public SquareWave(float cx, float cy, float n ,int time, float r) {
    super(cx, cy, n , time, r);
  }
  public float r0() {
    return 4 / PI;
  }
  public float sign(float n) {
    return 1;
  }
  public float freqRatio(float n) {
    return 2 * n - 1;
  }
  public float radiusRatio(float n) {
    return 2 * n - 1;
  }
  public SquareWave getChild() {
    return new SquareWave(px, py, n + 1 ,this.time, R0);
  }
}

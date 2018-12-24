class SquareWave extends FourierCircle {
  /* square wave */
  public SquareWave(float cx, float cy, float n ,int time, float r, float period) {
    super(cx, cy, n , time, r, period);
  }
  public float r0() {
    return 4 / PI;
  }
  public float sign() {
    return 1;
  }
  public float freqRatio() {
    return 2 * this.n - 1;
  }
  public float radiusRatio() {
    return 2 * this.n - 1;
  }
  public SquareWave getChild() {
    return new SquareWave(getPx(), getPy(), n + 1 ,this.time, size, period);
  }
}

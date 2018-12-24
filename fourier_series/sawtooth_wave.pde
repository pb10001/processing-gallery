class SawtoothWave extends FourierCircle {
  /* sawtooth wave */
  public SawtoothWave(float cx, float cy, float n ,int time, float r, float period) {
    super(cx, cy, n , time, r, period);
  }
  public float r0() {
    return 2 / PI;
  }
  public float sign() {
    return 1;
  }
  public float freqRatio() {
    return n;
  }
  public float radiusRatio() {
    return n;
  }
  public SawtoothWave getChild() {
    return new SawtoothWave(getPx(), getPy(), n + 1 ,this.time, size, period);
  }

}

class Particles extends GameObject {
  //enemy explosion
  Particles(float x, float y, float vx, float vy) {
    super(x, y, vx, vy, 1, 0, 1);
  }

  void show() {
    image(gif[lives], x, y);
    println(frameCount);
    //modulus of mod
    if ( frameCount %2==0)  lives = lives+1;
    if (lives== numberOfFrames) lives =0;
  }
}

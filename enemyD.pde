class EnemyD extends GameObject {
  int Ecooldown, Ethreshold;

  EnemyD() {
    super(random(width), -20, 0, 3, 100, p3, 1);
    Ecooldown = 30;
    Ethreshold = Ecooldown;
  }

  void act() {
    super.act();

    // managing guns
    Ecooldown++;
    if ( Ecooldown>= Ethreshold) {
      //shoot
      objects.add(new EnemyBullet(x, y, 0, 10));
      objects.add(new EnemyBullet(x, y, 10, 0));
      objects.add(new EnemyBullet(x, y, 0, -10));
      objects.add(new EnemyBullet(x, y, -10, 0));
      Ecooldown = 0;
    }

    //collisions
    int i = 0;
    while (i < objects.size()) {
      GameObject obj = objects.get(i); 
      if (obj instanceof Bullet) {
        if (collidingWith(obj)) {
          lives--;
        }
      }
      i++;
    }
    if (lives==0) {
      objects.add(new Particles(x, y, 10, 10));
      objects.add(new Particles(x, y, 5, 10));
      objects.add(new Particles(x, y, 3, 10));
      score = score+1;
    }
    if (offScreen()) lives = 0;
    if (offScreen()) lives = 0;
  }

  void show() {
    imageMode(CENTER);
    image(enemyB, x, y, 100, 100);
  }
}

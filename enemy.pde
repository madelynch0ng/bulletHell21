class EnemyA extends GameObject {
  int Ecooldown, Ethreshold;

  EnemyA() {
    super(random(width), -20, 0, 10, 100, yellow2, 1);
    Ecooldown = 30;
    Ethreshold = Ecooldown;
  }
  void act() {
    super.act();

    // managing guns
    Ecooldown++;
    if ( Ecooldown>= Ethreshold) {
      ////shoot
      //objects.add(new EnemyBullet(x, y, 0, 10));
      //Ecooldown = 0;
    }


    //collisions
    int i = 0;
    while (i < objects.size()) {
      GameObject obj = objects.get(i); 
      if (obj instanceof Bullet) {
        if (collidingWith(obj)) {
          lives--;
          obj.lives =0;
        }
      }
      i++;
    }

    if (lives==0) {
      // float x, float y, float vx, float vy
      objects.add(new Particles(x, y, 10, 10));
      objects.add(new Particles(x, y, 15, 10));
      objects.add(new Particles(x, y, -5, 10));
      objects.add(new Aid(x, y, 0, 10));
    
    }

    if (offScreen()) lives = 0;
  }
  void show() {
    imageMode(CENTER);
    image(enemy1, x, y, 100, 100);
  }
}

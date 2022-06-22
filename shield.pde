class Shield extends GameObject {
  int Ecooldown, Ethreshold;

  Shield() {
    super(random(width), -20, 0, 3, 140, yellow2, 4);
  }
  void act() {
    super.act();

    //collisions
    int i = 0;
    while (i < objects.size()) {
      GameObject obj = objects.get(i); 
      if (obj instanceof Bullet) {
        if (collidingWith(obj)) {
          lives=lives-1;
        }
      }
      i++;
    }
    if (offScreen()) lives = 0;
  }

  void show() {
    imageMode(CENTER);
    image(shield, x, y, 100, 100);
    if (lives==0) {
      protection = true;
      image(bubble, x, y, 200, 200);
      
    }
  }
}

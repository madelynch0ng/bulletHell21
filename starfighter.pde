class Starfighter extends GameObject {
  int cooldown, threshold;

  Starfighter() {
    super(width/2, height/2, 5, 0, 40, p1, 3);
    threshold = 10 ;
    cooldown = threshold;
  }

  void act() {
    super.act();

    //managing guns
    cooldown++;
    if (space && cooldown>= threshold) {
      objects.add(new Bullet());
      if (score>=2){
         objects.add(new Bullet());
      }
      cooldown = 0;
    }
    // controlling Starfighter
    if (rightkey ) vx= 5;
    if (leftkey) vx = -5;
    if (upkey) vy =-5;
    if (downkey) vy =5;
    if (!upkey && !downkey) vy = vy *0.9;
    if (!leftkey && !rightkey)vx = vx * 0.9;


    text("LIVES:" + lives, 190, 50);
    if (lives==0) {
      mode= GAMEOVER;
    }
    //collisions
    int i = 0;
    while (i < objects.size()) {
      GameObject obj = objects.get(i); 
      if (obj instanceof  EnemyBullet) {
        if (collidingWith(obj)) {
          lives--;
          obj.lives =0;
 
        }
      }
      i++;
    }


    //objects.add(new shied(x, y, 100, 100));

    //bounding 
    if (x< size/2 || x> width- size/2) {
      rightkey = false;
      leftkey = false;
      upkey = false;
      downkey = false;
    }
    if (y< size/2|| y> height - size/2) {
      rightkey = false;
      leftkey = false;
      upkey = false;
      downkey = false;
    }
  }
  void ship() {
    imageMode(CENTER);
    if (ship == SPACESHIP1)  image(spaceship1, x, y, 120, 120);
    if (ship == SPACESHIP2)  image(spaceship2, x, y, 120, 120);
    if (ship == SPACESHIP3)  image( spaceship3, x, y, 120, 120);
  }

  void show() {
    imageMode(CENTER);
    ship();
    if (lives==0) {
      mode=GAMEOVER;
    }

    //image(bubble, x,y,200,200);
  }
}

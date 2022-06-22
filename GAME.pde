void game() {
  fill(dblue, 110);
  noStroke();
  rect(width/2, height/2, width, height);
  addObjects();
  gameEngine();
  debug();

  //pause button/////////////////////////////
  noStroke();
  fill(0);
  circle(750, 60, 60);
  textSize(40);
  fill(255);
  text("||", 730, 75);

  //score/////////////////////////////////////////////
  fill (255);
  textSize(20);
  text("Score:" + score, 100, 50);

  //lives///////////////////////////////////////
  text("LIVES:" + lives, 190, 50);
  if (lives==0) {
    mode= GAMEOVER;
  }
}


void addObjects() {
  fill(255);
  objects.add(0, new Star());

  if (frameCount% 90 ==0 ) objects.add(new EnemyA());
  if (frameCount% 88 ==0 ) objects.add(new EnemyB());
  if (frameCount% 99 ==0 ) objects.add(new EnemyC());  
    if (frameCount% 99 ==0 ) objects.add(new EnemyD());
  if (frameCount% 300 ==0 ) objects.add(new Shield());
}

void gameEngine() {
  int i = 0;
  while (i < objects.size()) {
    GameObject o = objects.get(i);
    o.act();
    o.show();
    if (o.lives == 0) {
      objects.remove(i);
    } else {
      i++;
    }
  }

  //if (Starfighter.lives-1>0) {//////////////////////LIVEs - 1 when bullet hits  ,,,,,, timer reset.... reset spaceship to the middle. 
  //  lives--;
  //  Starfighter.x = width/2;
  //  Starfighter.y= height-200;
  //}

  }

  void debug() {
    //text(frameRate, 10, 10);
    //text( objects.size(), 10, 30);
  }
  void gameClicks() {
    if (mouseX > 720 && mouseX < 780 && mouseY > 30 && mouseY < 90) {
      mode = PAUSE;
    }
  }

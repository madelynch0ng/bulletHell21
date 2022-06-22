PImage starrynight;

void intro() {
  imageMode(CORNER);
  starrynight= loadImage("starrynight.jpg");
  image(starrynight, 0, 0, 800, 800);
  textSize(100);
  text("BUllET HELL", 100, 300);
  textSize(50);
  text("Tap To Start", 250, 700);


  fill(green);
  rect(550, 580, 200, 50);
  fill(255);
  textSize(30);   
  text("Options", 500, 600);
}

void introClicks() {
  if (mouseX > 200 && mouseX < 500 && mouseY > 600 && mouseY < 750) {
    mode = GAME;
  }

  if ( mouseX> 450 && mouseX< 750 &&  mouseY >580 && mouseY < 690) {
    mode = OPTIONS;
  }
}

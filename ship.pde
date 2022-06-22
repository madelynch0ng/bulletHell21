void ship() {
  imageMode(CENTER);
  if (ship == SPACESHIP1)  image(spaceship1,width/2, height/2, 120, 120);
  if (ship == SPACESHIP2)  image(spaceship2, width/2, height/2, 120, 120);
  if (ship == SPACESHIP3)image( spaceship3, width/2, height/2, 120, 120);
}

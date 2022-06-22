class Aid extends GameObject{
  Aid(float x, float y, float vx, float vy) {
    super(x, y, vx, vy, 5, 0, 1);
    
  }
  
  void act(){
    super.act();
    if(offScreen()) lives = 0;
    
    
  }
  void show(){
    image(aid,x,y,60,60);
  }
}

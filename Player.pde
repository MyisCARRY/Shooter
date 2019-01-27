class Player{
  float speed = 5;
  int hp = 100;
  int shield = 0;
  float x = width/2;
  float y = height/2;
  int xVelocity = 0;
  int yVelocity = 0;
  float angle=0;
  PVector location;
  int size = 40;
  Guns gun = new Guns();
  
  void move(){
      x += xVelocity * speed;
      y += yVelocity * speed;
      
      if(x < 0) x = 0;
      else if(x > width) x = width;
      else if(y < 0) y = 0;
      else if(y > height) y = height;
  }
  
  void show(){
    rotating();
    pushMatrix();
    translate(x, y);
    rotate(angle);
    rect(0, 0, size, size);
    popMatrix();
    
    textSize(40);
    text("HP "+ hp, width-150 , height-40);
    text("SH "+ shield, width-150 , height-8);
  }
  
  boolean collisionWithPowerUp(float a, float b){
    if( (x > a-20 && x < a+20) && (y > b-20 && y < b+20)){
      return true;
    }else return false;
  }
  
  void setXVelocity(int vel){
    this.xVelocity = vel;
  }
  
  void setYVelocity(int vel){
    this.yVelocity = vel;
  }
  
  void rotating(){
    if(mouseX != x){
      angle = (mouseY - y)/( mouseX - x);
      angle = atan(angle);
    }
  }
  
  float getX(){
    return this.x;
  }
  
  float getY(){
    return this.y;
  }
  
  float getAngle(){
    return this.angle;
  }
  
  int getHp(){
    return this.hp;
  }
  
  void setHp(int h){
    this.hp = h;
  }
  
  int getShield(){
    return this.shield;
  }
  
  void setShield(int h){
    this.shield = h;
  }
   
  float getSpeed(){
    return this.speed;
  }
  
  void setSpeed(float s){
    this.speed = s;
  }
  
  float getSize() {
    return this.size;
  }
  
  boolean collisionWtihZombie(Zombie z){
    float dist = sqrt( pow(this.x-z.getX(), 2) + pow(this.y-z.getY(), 2));
    fill(255);
    text(dist, 100, 100);
    if( this.size/2 + z.getSize()/2 >= dist ){
      return true;
    }
    else
      return false;
  }
}

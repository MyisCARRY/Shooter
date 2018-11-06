class Player{
  int speed = 5;
  int hp = 100;
  int shield = 0;
  int x = width/2;
  int y = height/2;
  int xVelocity = 0;
  int yVelocity = 0;
  float angle=0;
  
  void move(){
      x += xVelocity * speed;
      y += yVelocity * speed;
  }
  
  void show(){
    rotating();
    pushMatrix();
    translate(x, y);
    rotate(angle);
    rectMode(CENTER);
    rect(0, 0, 40, 40);
    popMatrix();
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
}

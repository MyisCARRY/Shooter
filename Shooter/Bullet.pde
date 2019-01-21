class Bullet{
  float x;
  float y;
  float velX;
  float velY;
  float angle;
  float damage;
  
  Bullet(float a, float b, float vx, float vy, float ang, float d){
    this.x = a;
    this.y = b;
    this.velX = vx;
    this.velY = vy;
    this.angle = ang;
    this.damage = d;
  }
  
  void move(){
    x += velX;
    y += velY;
  }
  
  void show(){
    pushMatrix();
    translate(x, y);
    rotate(angle);
    rectMode(CENTER);
    rect(0, 0, 20, 10);
    popMatrix();
  }
  
  void update(){
    this.move();
    this.show();
  }
  
  boolean outOfRange(){
    if(this.x > width || this.x < 0 || this.y > height || this.y < 0){
      return true;
    }
    else return false;
  }
}

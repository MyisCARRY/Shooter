class Zombie{
 float speed = 1;
 int hp = 100;
 float size = 40;
 int shield = 0;
 int attackPower = 0;
 int attackSpeed = 0;
 float x;
 float y;
 float angle = 0;
 
 Zombie(){
   float h=height-size/2;
   float w=width-size/2;
   int pom = (int)random(0,3+1);

   if(pom==0){
    x = 0 + size/2;
    y = (int)random(size/2, h+1);
   }
   if(pom==1){
    x = (int)random(size/2, w+1);
    y = 0 + size/2;
   }
   if(pom==2){
    x = w;
    y = (int)random(size/2, h+1);
   }
   if(pom==3){
    x = (int)random(size/2, w+1);
    y = h;
   }
 }
 void move(){
    
    if(guy.getX() < x)  x-=speed;
    if(guy.getX() > x) x+=speed;
    if(guy.getY() < y) y-=speed;
    if(guy.getY() > y) y+=speed;
 }
 void show(){
   rotating();
   pushMatrix();
   translate(x, y);
   rotate(angle);
   rectMode(CENTER);
   rect(0, 0, size, size);
   popMatrix();
 }
 void rotating(){
   if(guy.getX() != x){
    angle = (guy.getY() - y) / (guy.getX() - x);
    angle = atan(angle);
   }
 }
 void atack(){
   
 }
 
 void setHp(int hp){
  this.hp = hp; 
 }
 
  float getx(){
   return this.x;
  }
   
  float gety(){
   return this.y;
  }
  
  int getHp(){
   return this.hp;
  }
  
}

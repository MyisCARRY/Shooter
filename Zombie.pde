class Zombie{
 float speed = 1;
 float hp = 100;
 float size = 40;
 float shield = 0;
 float attackPower = 0;
 float attackSpeed = 0;
 float x;
 float y;
 float angle = 0;
 
 Zombie(){
   float h=height-size/2;
   float w=width-size/2;
   int pom = (int)random(0,3+1);

   if(pom==0){
    x = 0 + size/2;
    y = (int)random(h+1);
   }
   if(pom==1){
    x = (int)random(w+1);
    y = 0 + size/2;
   }
   if(pom==2){
    x = w;
    y = (int)random(h+1);
   }
   if(pom==3){
    x = (int)random(w+1);
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
 
 void setHp(float hp){
  this.hp = hp; 
 }
 
  float getx(){
   return this.x;
  }
   
  float gety(){
   return this.y;
  }
  
  float getHp(){
   return this.hp;
  }
  
}

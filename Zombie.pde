class Zombie{
 int speed = 1;
 int hp = 100;
 int size = 40;
 int shield = 0;
 int attackPower = 0;
 int attackSpeed = 0;
 int x;
 int y;
 float angle = 0;
 int speedRotate=2;
 
 Zombie(){
   int h=height-size/2;
   int w=width-size/2;
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
 void move(int guyx, int guyy){
    
    if(guyx < x)  x-=speed;
    if(guyx > x) x+=speed;
    if(guyy < y) y-=speed;
    if(guyy > y) y+=speed;
    rotating(guy.x,guy.y);
 }
 void show(){
   rectMode(CENTER);
   rect(x, y, size, size);
 }
 void rotating(int guyx, int guyy){
 }
 void atack(){
   
 }
}

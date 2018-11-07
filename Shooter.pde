Player guy;
ArrayList<Bullet> bullets = new ArrayList<Bullet>();
ArrayList<Bullet> bulletsToDelete = new ArrayList<Bullet>();
Zombie z1;
void setup(){
  size(1280, 800);
  guy = new Player();
  z1 = new Zombie();
}

void draw(){
  background(0);
  guy.show();
  guy.move();
  z1.show();
  z1.move(); 
  for(Bullet b:bullets){
    b.update();
    if( b.outOfRange() ){
      bulletsToDelete.add(b);
    }
  }
  
  bullets.removeAll(bulletsToDelete);
}

void keyPressed(){
  switch(key){
        case 'w':
          guy.setYVelocity(-1);
          break;
        case 's':
          guy.setYVelocity(1);
          break;
        case 'a':
          guy.setXVelocity(-1);
          break;
        case 'd':
          guy.setXVelocity(1);
          break;
      }
}

void keyReleased(){
  switch(key){
        case 'w':
          guy.setYVelocity(0);
          break;
        case 's':
          guy.setYVelocity(0);
          break;
        case 'a':
          guy.setXVelocity(0);
          break;
        case 'd':
          guy.setXVelocity(0);
          break;
      }
}
void mouseClicked(){
  float x = guy.getX();
  float y = guy.getY();
  float angle = guy.getAngle();
  float speed = guy.gun.getBulletSpeed();
  float dx = mouseX - x;
  float dy = mouseY - y;
  float len = sqrt(pow(dx, 2) + pow(dy, 2));
  if(len == 0) len = 0.0000001;
  float vx = dx/len * speed;
  float vy = dy/len * speed;
  
  bullets.add( new Bullet(x, y, vx, vy, angle) );
}

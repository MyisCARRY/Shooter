Player guy;
ArrayList<Bullet> bullets = new ArrayList<Bullet>();
ArrayList<Bullet> bulletsToDelete = new ArrayList<Bullet>();
ArrayList<PowerUp> powers = new ArrayList<PowerUp>();
ArrayList<PowerUp> powersToDelete = new ArrayList<PowerUp>();
ArrayList<Zombie> zombies = new ArrayList<Zombie>();
ArrayList<Zombie> zombiesToDelete = new ArrayList<Zombie>();
int protection = 0;
int numberOfZombies = 2;
int killedZombies = 0;
int sumKilledZombies = 0;
int level = 1;

void setup(){
  size(1280, 800);
  rectMode(CENTER);
  guy = new Player();
  addZombie(level);
}

void draw(){
  background(0);
  guy.show();
  guy.move();
  guy.gun.showAmmo();
  
  if(frameCount%450 == 0)
    powers.add(new PowerUp());
  
  for(PowerUp p:powers){
    p.show();
    if( guy.collisionWithPowerUp(p.getX(), p.getY()) ){
      p.use(guy);
      powersToDelete.add(p);
    }
  }
  
  powers.removeAll(powersToDelete);
  
  for(Bullet b:bullets){
    b.update();
    if( b.outOfRange() ){
      bulletsToDelete.add(b);
    }
  }
  
  bullets.removeAll(bulletsToDelete);
  
  for (Zombie z : zombies) {
    z.applyBehaviors(zombies);
    z.update(); 
    z.show();
    if( guy.collisionWtihZombie(z) )
      push(guy, z);
    for (Bullet b : bullets) {
      if (z.collisionWithBullets(b, z)) {
        bulletsToDelete.add(b);
        if (z.death(z)) {
          zombiesToDelete.add(z);
          killedZombies++;
          sumKilledZombies++;
        }
        //zombies.remove(z); sprawdzic dlaczego to nie dziala
      }
    }
    bullets.removeAll(bulletsToDelete);
  }
  zombies.removeAll(zombiesToDelete);
  if (numberOfZombies * level == killedZombies) {
    killedZombies = 0;
    level++;
    addZombie(level);
  }
  showText();
  guy.gun.showAmmo();
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
        case 'r':
          thread("reload");
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

void mousePressed(){
  if( guy.gun.shoot() ){
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
    float dmg = guy.gun.getDamage();
    x += vx*2;
    y += vy*2;
    
    bullets.add( new Bullet(x, y, vx, vy, angle, dmg) );
  }
}

void reload(){
  guy.gun.reload();
}

void speed(){
  delay(3000);
  float s = guy.getSpeed();
  s -= 5;
  guy.setSpeed(s);
}

void push(Player p, Zombie z){
  float x = ( 10*(z.getPosition().x - p.getX()) / (z.getSize()/2 + p.getSize()/2) );
  float y = ( (z.getPosition().y - p.getY())*(z.getSize()/2 + p.getSize()/2 + 10) / (z.getSize()/2 + p.getSize()/2) );
  z.setPositionX(x);
  z.setPositionY(y);
  p.setHp(p.getHp()-5);
}

boolean birthCollision(int i) {
  for (int j = 0; j<i; j++) {
    Zombie z1 = zombies.get(j);
    PVector pos1 = z1.getPosition();
    float size1 = z1.getSize();
    for (int k = 0; k < zombies.size(); k++) {
      Zombie z2 = zombies.get(k);
      PVector pos2 = z2.getPosition();
      float size2 = z2.getSize();
      if (j != k && (dist(pos1.x, pos1.y, pos2.x, pos2.y)) < (size1 + size2) / 2) {
        return true;
      }
    }
  }
  return false;
}
void addZombie(int l) {
  for (int i = 0; i < numberOfZombies * l; i++) {
    zombies.add(new Zombie());
    if (birthCollision(i) == true) { 
      zombies.remove(i);
      i--;
      protection++;
      if (protection >10000) {
        println("WARNING: TOO MUCH ZOMBIES!");
        println("YOU WANT "+numberOfZombies * level+" ZOMBIES BUT HERE IS "+i+" ZOMBIES");
        zombies.remove(i);
        break;
      }
    }
  }
}
void showText() {
  fill(255);
  textAlign(CENTER);
  textSize(60);
  text("ROUND "+level, width/2, 50);
  textAlign(RIGHT);
  textSize(40);
  text("KILLED "+ sumKilledZombies, width, height - 75);
}

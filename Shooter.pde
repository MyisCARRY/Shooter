int numberZombie=10;
Player guy;
Zombie[] z = new Zombie[numberZombie];
void setup(){
  size(1280, 800);
  guy = new Player();
  for(int i=0;i<numberZombie;i++){
      z[i] = new Zombie();
  }
}

void draw(){
  background(0);
  guy.show();
  guy.move();
  for(int i=0;i<numberZombie;i++){
    z[i].show();
    z[i].move(guy.x, guy.y); 
  }
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

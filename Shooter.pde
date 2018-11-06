Player guy;

void setup(){
  size(1280, 800);
  guy = new Player();
}

void draw(){
  background(0);
  guy.show();
  guy.move();
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

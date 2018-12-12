class Steering {
  ArrayList<Zombie> zombies;
  private int numberOfZombies=10;
  private int protection = 0;
  private int id = 0;
  public Steering() {
    zombies = new ArrayList<Zombie>();
  }

  void addZombie() {
    for (int i = 0; i < numberOfZombies; i++) {
      zombies.add(new Zombie());
      if (birthCollision(i) == true) { 
        zombies.remove(i);
        i--;
        id--;
        protection++;
        if (protection >10000) {
          println("WARNING: TOO MUCH ZOMBIES!");
          println("YOU WANT "+numberOfZombies+" ZOMBIES BUT HERE IS "+i+" ZOMBIES");
          zombies.remove(i);
          break;
        }
      }
      id++;
    }
  }
  void update() {
    for (Zombie z : zombies) {
      z.applyBehaviors(zombies);
      z.update(); 
      z.show();
    }
  }
  boolean birthCollision(int i) {
    for (int j = 0; j<i; j++) {
      Zombie z1 = zombies.get(j);
      PVector pos1 = z1.getPosition();
      float size = z1.getSize();
      for (int k = 0; k < zombies.size(); k++) {
        Zombie z2 = zombies.get(k);
        PVector pos2 = z2.getPosition();
        if (j != k && (dist(pos1.x, pos1.y, pos2.x, pos2.y)) < size) {
          return true;
        }
      }
    }
    return false;
  }
}

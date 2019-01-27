class Guns{
  float damage = 10;
  int bulletSpeed = 10;
  int magazineSize = 12;
  int totalAmmo = 999;
  int currentAmmo = 12;
  boolean reloading = false;

  int getBulletSpeed(){
    return this.bulletSpeed;
  }
  
  float getDamage(){
    return damage;
  }
  
  boolean shoot(){    
    if(currentAmmo <= 0)return false;
    else{
      currentAmmo--;
      return true;
    }
  }
  
  void showAmmo(){
    fill(255);
    textSize(40);
    text(currentAmmo + "/" + totalAmmo, 150, 50);
  }
  
  void reload(){
    if(!reloading){
      reloading = true;
      currentAmmo = 0;
      delay(1500);
      int ammoLeft = currentAmmo;
      
      if(magazineSize <= totalAmmo + ammoLeft && ammoLeft < magazineSize && totalAmmo>0){
        currentAmmo = magazineSize;
        totalAmmo -= magazineSize;
        totalAmmo += ammoLeft;
      }
      else if(magazineSize > totalAmmo + ammoLeft && ammoLeft < magazineSize && totalAmmo > 0){
        currentAmmo = totalAmmo + ammoLeft;
        totalAmmo = 0;
      }
      reloading = false;
    }
  }
}

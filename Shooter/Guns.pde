class Guns{
  float damage = 10;
  int bulletSpeed = 10;
  int magazineSize = 12;
  int totalAmmo = 999;
  int currentAmmo = 12;

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
    textSize(60);
    text(currentAmmo + "/" + totalAmmo, 0, 50);
  }
  
  void reloading(){
    textSize(30);
    text("Reloading", width/2, 50);
  }
  
  void reload(){
    int ammoLeft = currentAmmo;
    
    if(magazineSize <= totalAmmo + ammoLeft && ammoLeft < magazineSize && totalAmmo>0){
      currentAmmo = magazineSize;
      totalAmmo -= magazineSize;
      totalAmmo += ammoLeft;
      this.reloading();
    }
    else if(magazineSize > totalAmmo + ammoLeft && ammoLeft < magazineSize && totalAmmo > 0){
      currentAmmo = totalAmmo + ammoLeft;
      totalAmmo = 0;
      this.reloading();
    }
  }
}

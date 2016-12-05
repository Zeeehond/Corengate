class Enemy {

  int diameter, radius;
  
  int x;
  int y;
  int clrEnemy;
  int enemyX = 512;
  float enemyY;
  float enemySpeed = 1;
  int enemyLane;  
  
  void init () {
    
    
    diameter = 150;
    radius = diameter /2;
    clrEnemy = color (255, 0, 0);
    
    enemyY = 50;
   
  
   
    }




  void draw() {
       
   move();
   
   fill(clrEnemy);
   ellipse(enemyX, enemyY, radius, radius);
   enemyY ++;
    if (enemyY > height) {
      enemyY = enemyLane;
      enemyLane = int(random(3));
    
     if (enemyLane == 0) {
      enemyX = 362;
    }
    if (enemyLane == 1) {
      enemyX = 512;
    }
    if (enemyLane == 2) {
      enemyX = 662;
    }
    }
    
    if (alive == false) {
      theChr.x = 1100;
      theChr.y = 800;
    }
  if (dist(theChr.x, theChr.y, enemyX, enemyY) < radius) {
   // Collision
   alive=false;
   // reset();
  }
  if ( scoore %100 == 0) {
    enemySpeed += 0.21;
   }
  }
    void move(){
// Change the x location by speed
  enemyY = enemyY + enemySpeed;
 }
}
class Enemy {

  //variabelen van de enemy
  int diameter, radius;
  int x;
  int y;
  int clrEnemy;
  int enemyX = 512;
  float enemyY;
  float enemySpeed = 1;
  int enemyLane;  

  void init () {
    // intialiseert de variabelen
    diameter = 150;
    radius = diameter /2;
    clrEnemy = color (255, 0, 0); 
    enemyY = 50;
  }

  void update() {
    move();

    enemyY ++;
    
    //toewijzen van lanes aan de enemy
    if (enemyY > height) {
      enemyY = enemyLane;
      enemyLane = int(random(3));

      //de lanes van de enemy
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

    //stuurt de character buiten het scherm als de enemy de character dood
    if (alive == false) {
      theChr.x = 1100;
      theChr.y = 800;
    }
    // Collision
    if (dist(theChr.x, theChr.y, enemyX, enemyY) < radius) {
      alive=false;
      // reset();
    }

    // geeft snelheid aan de enemy
    if ( score %100 == 0) {
      enemySpeed += 0.21;
    }

    //(UNDER CONSTRUCTION)
    if (m% 10 == 0) {
      score ++;
    }
  }

  void move() {
    // verandert de snelheid van de enemy op de y-as
    enemyY = enemyY + enemySpeed;
  }

  void draw() {
    //tekent de enemy
    fill(clrEnemy);
    ellipse(enemyX, enemyY, radius, radius);
  }
}
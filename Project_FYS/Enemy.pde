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
  PImage guard;
  int guardLength; //Lengte van de enemy sprite
  int guardWidth; //Breedte van de enemy sprite

  boolean hit = false;

  void init () {
    // intialiseert de variabelen
    guard = loadImage("guard.png");
    guardLength = 100;
    guardWidth = 75;
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
    // Collision enemy with player
    if (overlapsPlayer((int)enemyX, (int)enemyY) && !star.STAR)
    {
      alive = false;
      //reset();
    }

    // geeft snelheid aan de enemy
    if ( score %100 == 0) {
      enemySpeed += 0.22;
    }
  }

  void move() {
    // verandert de snelheid van de enemy op de y-as
    enemyY = enemyY + enemySpeed;
  }

  void draw() {
    //tekent de enemy
    image(guard, enemyX - guardWidth/2, enemyY - guardLength/2);
  }
}
class Enemy2 {

  //variabelen van de enemy
  int diameter, radius;
  int x;
  int y;
  int clrEnemy2;
  int enemy2X = 512;
  float enemy2Y;
  float enemySpeed2 = 1;
  int enemyLane2;
  PImage guard;
  int guardLength; //Lengte van de enemy sprite
  int guardWidth; //Breedte van de enemy sprite

  void init () {
    // intialiseert de variabelen
    guard = loadImage("guard.png");
    guardLength = 100;
    guardWidth = 75;
    enemy2Y = 50;
  }

  void update() {
    move();

    enemy2Y ++;
    enemy2Y = theNmy.enemyY;

    //toewijzen van lanes aan de enemy
    if (enemy2Y > height) {
      enemy2Y = enemyLane2;
      enemyLane2 = int(random(3));

      //de lanes van de enemy
      if (enemyLane2 == 0) {
        enemy2X = 362;
      }
      if (enemyLane2 == 1) {
        enemy2X = 512;
      }
      if (enemyLane2 == 2) {
        enemy2X = 662;
      }
    }

    //stuurt de character buiten het scherm als de enemy de character dood
    if (alive == false) {
      theChr.x = 1100;
      theChr.y = 800;
    }
    // Collision enemy2 with player
    /*
    if (dist(theChr.x, theChr.y, enemy2X, enemy2Y) < radius && !star.STAR) {
     alive=false;
     // reset();
     }
     */
    if (overlapsPlayer((int)enemy2X, (int)enemy2Y) && !star.STAR)
    {
      alive = false;
    }

    // geeft snelheid aan de enemy
    if ( score %100 == 0) {
      enemySpeed2 += 0.22;
    }
  }

  void move() {
    // verandert de snelheid van de enemy op de y-as
    enemy2Y = enemy2Y + enemySpeed2;
  }

  void draw() {
    //tekent de enemy
    image(guard, enemy2X - guardWidth/2, enemy2Y - guardLength/2);
  }
}
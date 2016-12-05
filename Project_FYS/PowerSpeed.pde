class PowerSpeed {
  // variable
  int diameter, radius;
  int x;
  int y;
  int clrPowerSpeed;
  int PowerSpeedX = 512;
  float PowerSpeedY;
  float PowerSpeed =1;
  int PowerSpeedLane;  

  // initalize alle var.
  void init () {

    //  powerup speed (vorm kleur)
    diameter = 50;
    radius = diameter /2;
    clrPowerSpeed = color (50, 150, 50 );

    PowerSpeedY = -100;
  }

  // respawn in welke lane willekeurig.
  void respawn() {

    PowerSpeedY = PowerSpeedLane;
    PowerSpeedLane = int(random(5));

    if (PowerSpeedLane == 0) {
      PowerSpeedX = 362;
    }
    if (PowerSpeedLane == 1) {
      PowerSpeedX = 512;
    }
    if (PowerSpeedLane == 2) {
      PowerSpeedX = 662;
    }
  }



  void update() {
    move();
    // als powerup scherm verlaat respawn.
    if (PowerSpeedY > height) {
      respawn();
    }
    if (dist(theChr.x, theChr.y, PowerSpeedX, PowerSpeedY) < radius + theChr.radius) {
      // Collision met player respawn.
      theNmy.enemySpeed += 1;
      speed += 1;
      respawn();
    }
  }

  // maakt de powerup aan.
  void draw() {
    fill(clrPowerSpeed);
    ellipse(PowerSpeedX, PowerSpeedY, radius, radius);
  }
  // powerup speed.
  void move() {
    // Change the x location by speed
    PowerSpeedY = PowerSpeedY + PowerSpeed;
  }
}
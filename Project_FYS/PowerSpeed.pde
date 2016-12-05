class PowerSpeed {


  int diameter, radius;

  int x;
  int y;
  int clrPowerSpeed;
  int PowerSpeedX = 512;
  float PowerSpeedY;
  float PowerSpeed =1;
  int PowerSpeedLane;  


  void init () {


    diameter = 50;
    radius = diameter /2;
    clrPowerSpeed = color (50, 150, 50 );

    PowerSpeedY = -100;
  }


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

    if (PowerSpeedY > height) {
      respawn();
    }
    if (dist(theChr.x, theChr.y, PowerSpeedX, PowerSpeedY) < radius + theChr.radius) {
      // Collision
      scorecount += 500;
      theNmy.enemySpeed += 1;
      theNmy2.enemySpeed2 += 1;
      speed += 1;
      respawn();
    }
  }


  void draw() {
    fill(clrPowerSpeed);
    ellipse(PowerSpeedX, PowerSpeedY, radius, radius);
  }

  void move() {
    // Change the x location by speed
    PowerSpeedY = PowerSpeedY + PowerSpeed;
  }
}
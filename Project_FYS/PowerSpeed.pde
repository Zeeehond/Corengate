class PowerSpeed {

  int spriteFrame = 0; //Laat de animatiecycle op het eerste frame beginnen
  int diameter, radius;

  int x;
  int y;
  int clrPowerSpeed;
  int PowerSpeedX = 512;
  float PowerSpeedY;
  float PowerSpeed =1;
  int PowerSpeedLane;
  PImage conv0, conv1, conv2, conv3, conv4; //Afbeeldingen voor de speedup
  int convLength;
  int convWidth;


  void init () {
    conv0 = loadImage("conv0.png");
    conv1 = loadImage("conv1.png");
    conv2 = loadImage("conv2.png");
    conv3 = loadImage("conv3.png");
    conv4 = loadImage("conv4.png");
    
    convLength = 100;
    convWidth = 75;
    
    //diameter = 50;
    //radius = diameter /2;
    //clrPowerSpeed = color (50, 150, 50 );
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
      if(overlapsPlayer((int)PowerSpeedX, (int)PowerSpeedY))
      {
        // Collision
        fileSpeed.play();
        scorecount += 500;
        theNmy.enemySpeed += 1;
        theNmy2.enemySpeed2 += 1;
        speed += 1;
        respawn();
      }
      
    //Animatie van de speedup
    spriteFrame++;
    if (spriteFrame == 26) spriteFrame = 0;
  }

  void draw() {
    if (spriteFrame <= 5){
      image(conv0, PowerSpeedX - convWidth/2, PowerSpeedY - convLength/2);
    } else if (spriteFrame > 5 && spriteFrame <= 10) {
      image(conv1, PowerSpeedX - convWidth/2, PowerSpeedY - convLength/2);
    } else if (spriteFrame > 10 && spriteFrame <= 15) {
      image(conv2, PowerSpeedX - convWidth/2, PowerSpeedY - convLength/2);
    } else if (spriteFrame > 15 && spriteFrame <= 20) {
      image(conv3, PowerSpeedX - convWidth/2, PowerSpeedY - convLength/2);
    } else if (spriteFrame > 20 && spriteFrame <= 25) {
      image(conv4, PowerSpeedX - convWidth/2, PowerSpeedY - convLength/2);
    }
    
    //fill(clrPowerSpeed);
    //ellipse(PowerSpeedX, PowerSpeedY, radius, radius);
  }

  void move() {
    // Change the x location by speed
    PowerSpeedY = PowerSpeedY + PowerSpeed;
  }
}
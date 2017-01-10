class Star {


  int diameter, radius;
  int x;
  int y;
  int clrstar;
  int starX = 512;
  float starY;
  float star =1;
  int starLane;  
  int STARCounter;
  int tintClr;
  PImage inv;
  int invLength;
  int invWidth;
  
boolean STAR = false;

  void init () {
    STARCounter = 0;
    inv = loadImage("star.png");
    invLength = 75;
    invWidth = 75;
    diameter = 50;
    radius = diameter /2;
    clrstar = color (253, 245, 36 );

    starY = -100;
  }

  void respawn() {
    if (t == 0) {
    starY = starLane;
    starLane = int(random(3));

    if (starLane == 0) {
      starX = 362;
    }
    if (starLane == 1) {
      starX = 512;
    }
    if (starLane == 2) {
      starX = 662;
     }
    }
  }


  void update() {
    move();

   if(overlapsPlayer((int)starX,(int)starY))
   {
      // Collision
      starSound.play();
      STAR = true;
     // println("yas");
     respawn();
     
     
   }
   if (STAR == true) {
            starX = 1500; 
           STARCounter++;
           
           tintClr = int(random(2));
     
               if (tintClr == 0) 
               {
               tint(255,255,0);
               }
               if (tintClr == 1)
               {
                tint(255,100,0); 
               }
               
   }
      if (STARCounter == 300) {
        STAR = false;
        STARCounter = 0;
        noTint();
    
      }

    if (starY > height) {
    respawn();
    }
  }


  void draw() {
    //Tekent de sprite voor invincibility
    image(inv, starX - invWidth/2, starY - invLength/2);
      
}


  void move() {
    // Change the x location by speed
    starY++;
    starY = starY + star;
  }
}
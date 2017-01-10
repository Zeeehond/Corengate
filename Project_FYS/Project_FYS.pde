//Importing the sound library and the songs from the map 'data'.
import processing.sound.*;
SoundFile backgroundMusic;
SoundFile starSound;
SoundFile speedSound;

//Declaring the variables.
float y =1;
float speed = 1;
PImage d;
int bx = 390;
int by = 400;
int  stage = 0;
boolean alive = true;
int scorecount = 0;
int score;
int topScore;
String time = "001";
int t;
int interval = 1;


Lanes theLns = new Lanes ();
Char theChr = new Char();
Enemy theNmy = new Enemy();
Enemy2 theNmy2 = new Enemy2();
PowerUp powerUp = new PowerUp();
PowerSpeed powerSpeed = new PowerSpeed();
PowerDown PowerDown = new PowerDown();
Highscore theScore = new Highscore();
Star star = new Star();
Timer Timer = new Timer();

void setup() {
  /* The background image must be the same size as the parameters
   into the size() method. In this program, the size of the image
   is 1024 x 720 pixels. */
  size(1024, 720);
  d = loadImage("bg.png");
  theChr.init(); 
  theNmy.init();
  theNmy2.init();
  //powerUp.init();
  powerSpeed.init();
  star.init();
  smooth();
  rectMode(CENTER);
  noStroke();

  // If 'esc' is pressed, the game exits.
  if (key == CODED) {
    if (keyCode == ESC) {
      //Exit
    }
  }
  //Retrieving the songs including the backgroundmusic from the map 'data'.
  starSound = new SoundFile(this, "star.wav");
  speedSound = new SoundFile(this, "speed.wav"); 
  backgroundMusic = new SoundFile(this, "bgmusic.mp3"); 

  //since the backgroundmusic is name 'file' were starting the song, we make ik stop and in the end loop this proces.  
  backgroundMusic.play();
  backgroundMusic.stop();
  backgroundMusic.loop();
}



// The function keypressed which will work if a certain key is pressed.
void keyPressed() {
  //The character momevent, make's the character moves left to right.
  theChr.keyPressed();

  //If the 'z' key is pressed and player is not alive, the game will restart.
  if (key == 'z') {
    if (!alive) {
      reset();

      loop();
    }
  }
}
//Retreiving all the updates 
void updateMe() {
  theLns.update();
  theChr.update();
  theNmy.update();
  theNmy2.update();
  //powerUp.update();
  PowerDown.update();
  powerSpeed.update();
  theScore.update();
  star.update();
  Timer.update();

  //The score is based on the frames, you gain 1 point every frame. We divide the score to make it look better.
  scorecount++;
  score = scorecount/10;
}

//Retreiving all the draw's. This is done once per game, and not every frame.
void drawMe() {
  theLns.draw();
  powerSpeed.draw();
  theNmy.draw();
  theNmy2.draw();
  //powerUp.draw();
  PowerDown.draw();
  star.draw();
  theChr.draw();
  fill(0, 0, 255);
  textSize(20);


  // If the player dies, we show the scoreboard and stop the game until the player resets it with the Z button.
  if (alive == false) {

    background(0);  
    theScore.setup();
    theScore.draw();
    theScore.update();
    theScore.addNewScore(score); 
    noLoop();
  }
}

// If the game resets, do the following steps. 
void reset() { 
  alive = true;
  score = 0;
  scorecount = 0;
  theNmy.enemySpeed = 1;
  theNmy2.enemySpeed2 = 1;
  speed = 1; 
  theChr.init(); 
  theNmy.init();
  theNmy2.init();
  powerUp.init();
  star.init();
  powerSpeed.init();
  theNmy.draw();
  theNmy2.draw();
  // powerUp.draw();
  powerSpeed.draw();
  star.draw();
}




//Hier afblijven, k bye

void draw() {
  updateMe();
  drawMe();
}
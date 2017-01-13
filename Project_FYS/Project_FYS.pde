//Importing the sound library and the songs from the map 'data'.
import processing.sound.*;
SoundFile file;
SoundFile fileStar;
SoundFile fileSpeed;

//Declaring the variables.
float y =1;
float speed = 1;
PImage d;
int bx = 390;
int by = 400;
int  stage = 0;
boolean alive;
int scorecount = 0;
int score;
int topScore;
String time = "001";
int t;
int interval = 1;
PFont Font1;

final int START_SCREEN = 0;
final int PLAYING = 1;
final int INSTRUCTION = 2;
//A globally acesible variable called gameState
int gameState;


// These are the constructors, this makes it easier to call something from a class.
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
StartScreen startScreen = new StartScreen();
InstructionScreen instructionScreen = new InstructionScreen();



void setup() {
  size(1024, 720);
  d = loadImage("bg.png");
  // The background image must be the same size as the parameters
  // into the size() method. In this program, the size of the image
  // is 1024 x 720 pixels.
  startScreen.init();
  instructionScreen.init();
  theChr.init(); 
  theNmy.init();
  theNmy2.init();
  //powerUp.init();
  powerSpeed.init();
  PowerDown.init();
  star.init();
  Font1 = createFont("Arial Bold", 18);
  smooth();
  rectMode(CENTER);
  noStroke();

  // If 'esc' is pressed, exit the game.
  if (key == CODED) {
    if (keyCode == ESC) {
      //Exit
    }
  }



  //Retrieving the songs including the backgroundmusic from the map 'data'.
  fileStar = new SoundFile(this, "star.wav");
  fileSpeed = new SoundFile(this, "speed.wav"); 
  file = new SoundFile(this, "bgmusic.mp3"); 

  //since the backgroundmusic is name 'file' were starting the song, we make ik stop and in the end loop this proces.  
 
  file.play();
  file.stop();
  file.loop();
 
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

  //Since the update is updated every frame, each frame we add 1 to our score. The score is divided by 10 to make to score smooth. 
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


  // If the player dies, do the following. 
  if (!alive && gameState == PLAYING) {
   
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




//------------------------------------- DO NOT CROSS THIS LINE --------------------------------------------

void draw() {

  switch (gameState) {
  case START_SCREEN:
    alive = false;
    startScreen.updateAndDraw();
    break;
  case PLAYING:
    alive = true;
    updateMe();
    drawMe();
    break;

  case INSTRUCTION:
    alive = false;
    instructionScreen.updateAndDraw();
  }

  //update key states
  updateKeys();
}
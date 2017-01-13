// Arrays of booleans. One for each key code
boolean [] lastFrameKeysPressed = new boolean[256];
boolean [] keysPressed = new boolean[256];

// Call this method after each update in order to remember
// which keys were pressed in the last frame
void updateKeys() {
  for (int iKey=0; iKey<keysPressed.length; iKey++)
    lastFrameKeysPressed[iKey] = keysPressed[iKey];
}

// keyPressed is a Processing specific "callback" method
// that gets called when a key is pressed
// Set the boolean at the index of "keyCode" to true 
void keyPressed() {
  keysPressed[keyCode] = true;

  //Controls van de Character
  if (keyCode == RIGHT) {
    if (alive == true) {
      theChr.x = theChr.x+150;
      theChr.lane = theChr.lane + 1;
    }
  }
  if (keyCode == LEFT) {
    if (alive == true) {
      theChr.x = theChr.x-150;
      theChr.lane = theChr.lane - 1;
    }
  }

  if (gameState == START_SCREEN && keyCode == LEFT) {
    //Playing
    gameState = PLAYING;
  }
  if (gameState == START_SCREEN && keyCode == RIGHT) {
    //Playing
    gameState = PLAYING;
  }   

  if (gameState == START_SCREEN && keyCode == UP) {
    // Instruction menu
    gameState = INSTRUCTION;
  }

  if (gameState == INSTRUCTION && keyCode == DOWN) {
    // go back to start screen
    gameState = START_SCREEN;
  }
  //If the 'z' key is pressed and player is not alive, the game will restart.
  if (key == 'z') {
    if (!alive) {
      reset();

      loop();
    }
  }
}

// keyPressed is a Processing specific "callback" method
// that gets called when a key is released
// Set the boolean at the index of "keyCode" to true
void keyReleased() {
  keysPressed[keyCode] = false;
}
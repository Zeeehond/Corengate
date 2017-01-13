boolean overlapsPlayer(int x, int y)
{
  int playerX = theChr.x + (theChr.charWidth/2);    //indicates the lane player is in
  int playerY = theChr.y;                         //top of the player instance
  
  return(
          x == playerX  &&                        //star object is in the same lane as player
          y >= playerY  &&                        //star object is farther down than top of player
          y <= height
        );  
}t
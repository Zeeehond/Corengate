class Highscore {
int[] scores = new int[5];



  void setup() {
    textSize(30);
    for (int i=0; i<scores.length; i++) {
      scores[0] = 2110;
      scores[1] = 1934;
      scores[2] = 1890;
      scores[3] = 1823;
      scores[4] = score;
    }
  }

  void draw() {
    background(0);
    text("Scores: ", 50, 60);
    for (int i=0; i<scores.length; i++) {
      text(scores[i], 50, 120+60*i);
    }
    text("Last try: ", 220, 60);
    text(score, 220, 120);
    text("press 'Z' to restart",720,700);
  }

   void keyPressed() {
    // score = int(random(1000));
    // addNewScore(score);
   }

  void addNewScore(int score) {
    for (int i=0; i<scores.length; i++) {
      if (score<=scores[i]) {
        for (int j=scores.length-1; j>=max(i, 1); j--) {
          scores[j] = scores[j-1];
        }
        scores[i] = score;
        break;
      }
    }
  }
}
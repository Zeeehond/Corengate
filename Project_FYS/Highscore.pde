class Highscore {
  int[] scores = new int[5];

  void setup() {
    textSize(30);

    for (int i=0; i<scores.length; i++) {
      scores[i] += score;
      score=0;
    }
  }

  void draw() {
    background(0);
    text("Scores: ", 50, 60);
    for (int i=0; i<scores.length; i++) {
      text(scores[i], 50, 120+60*i);
    }
    //text("Last try: ", 220, 60);
    //text(score, 220, 120);
    text("press Z     to restart", 720, 700);
  }
  void update() {
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
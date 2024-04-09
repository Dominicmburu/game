class ScoreBoard {
  int score;

  ScoreBoard() {
    score = 110; // Initialize score to 110
  }

  void update() {
    // Draw the text in the top right corner of the screen
    textSize(32);
    fill(255);
    text("Score: " + score, width - 200, 50);
  }

  void addToScore(int points) {
    score += points; // Add the parameter points to the current score
  }
}

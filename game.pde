Cannon cannon;
ScoreBoard scoreBoard;
Target target;

void setup() {
  size(800, 600);
  cannon = new Cannon();
  scoreBoard = new ScoreBoard();
  target = new Target(cannon.amo);
}

void draw() {
  background(255); // White background
  
  // Game Over check
  if (target.isDestroyed) {
    textSize(32);
    fill(255, 0, 0);
    text("Game Over", width / 2 - 100, height / 2);
    noLoop(); // Stop drawing
    return;
  }
  
  // UI elements
  drawInterface();
  
  // Game elements
  scoreBoard.update();
  target.update();
  cannon.update();
  cannon.display();
}

void drawInterface() {
  // Draw the green control panel
  fill(0, 255, 0);
  rect(0, height - 110, 200, 110);
  
  // Draw buttons within the control panel
  drawButton(20, height - 60, "<"); // Left
  drawButton(80, height - 90, "^"); // Up
  drawButton(140, height - 60, ">"); // Right
  drawButton(80, height - 30, "v"); // Down
  drawButton(80, height - 60, "Fire"); // Fire button
  
    // Speed indicator to the right of the button box
  fill(200); // Red for speed indicator
  rect(200, height - 110, 20, 200); // Draw speed indicator within green background
  
  
  // Speed indicator to the right of the button box
  fill(255, 0, 0); // Red for speed indicator
  float speedIndicatorHeight = cannon.speed * 5; // Dynamic height based on cannon speed
  float speedIndicatorY = height - 50 + (50 - speedIndicatorHeight);
  rect(200, speedIndicatorY, 20, speedIndicatorHeight); // Draw speed indicator within green background
  
  // Score display
  fill(0);
  textAlign(RIGHT);
  textSize(24);
  text("Score: " + scoreBoard.score, width - 10, 30);
}

void drawButton(float x, float y, String label) {
  fill(200); // Grey for buttons
  rect(x, y, 30, 20); // Draw button
  fill(0); // Text color
  textSize(14);
  textAlign(CENTER, CENTER);
  text(label, x + 15, y + 10); // Center text on button
  
}

void mousePressed() {
  // Check if a button was clicked and perform the corresponding action
  // Left button check
  if (mouseY > height - 60 && mouseY < height - 40 && mouseX > 20 && mouseX < 50) {
    cannon.adjustAngle(-PI / 18);
  }
  // Up button check
  if (mouseY > height - 90 && mouseY < height - 70 && mouseX > 80 && mouseX < 110) {
    cannon.adjustSpeed(1);
  }
  // Right button check
  if (mouseY > height - 60 && mouseY < height - 40 && mouseX > 140 && mouseX < 170) {
    cannon.adjustAngle(PI / 18);
  }
  // Down button check
  if (mouseY > height - 30 && mouseY < height - 10 && mouseX > 80 && mouseX < 110) {
    cannon.adjustSpeed(-1);
  }
  // Fire button check
  if (mouseY > height - 60 && mouseY < height - 40 && mouseX > 80 && mouseX < 110) {
    cannon.fire();
    scoreBoard.addToScore(-10);
  }
}

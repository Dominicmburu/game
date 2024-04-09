class Cannon {
  ArrayList<CannonBall> amo;
  float angle = PI / 6; // Setting initial angle to 30 degrees up
  float speed = 5; // Initial speed

  Cannon() {
    amo = new ArrayList<CannonBall>();
  }

  void fire() {
    // Adjust firing position to match the cannon tip
    // Calculation for the position of the tip of the cannon based on its angle
    //float cannonLength = 40; // Assuming the length of the cannon is 40 pixels
    ////float tipX = 70 + cannonLength * cos(angle); // x position of cannon tip
    ////float tipY = height - 120 - cannonLength * sin(angle); // y position of cannon tip
    
    //float tipX = 70 + cannonLength * cos(angle);
    //float tipY = 480 -cannonLength * sin(angle);
    
    //amo.add(new CannonBall(tipX, tipY, angle, speed));
    
    float tipX = 80 + cos(angle) * 40; // Adjusted for the length of the cannon
    float tipY = height - 120 + sin(angle) * 40; // Adjusted for the height of the control panel
    amo.add(new CannonBall(tipX, tipY, angle, speed));
  }

  void update() {
    int i = 0;
    while (i < amo.size()) {
      CannonBall ball = amo.get(i);
      ball.update();
      if (ball.bounces >= 3) {
        amo.remove(i);
      } else {
        i++;
      }
    }
  }

  void display() {
  // Draw additional black block as base just before the cannon
  fill(0); // The block is black
  rect(50, height - 130, 30, 20); // Base block of the cannon

  //// Calculate the tip of the cannon for displaying the firing point
  //float cannonLength = 40; // The length of the cannon is 40 pixels
  //float tipX = 70 + cannonLength * cos(angle); // x position of cannon tip
  //float tipY = height - 120 - cannonLength * sin(angle); // y position of cannon tip

  // Draw cannon, adjusted to rotate around the end tip and appear after the base block
  fill(0); // Cannon is black
  pushMatrix();
  // Translate to the rotation point at the end of the base block
  translate(70, 480); // Adjusted to be at the end of the base block
  rotate(angle);
  rect(0, -10, 40, 20); // Drawing the cannon with its base at the pivot
  popMatrix();
  
  //// Draw the firing point at the tip of the cannon
  //fill(255, 0, 0); // Making the firing point red for visibility
  //ellipse(tipX, tipY, 10, 10); // Drawing a small circle as the firing point

  // Draw cannonballs
  for (CannonBall ball : amo) {
    ball.display();
  }
}

  
  void adjustAngle(float adjustment) {
    angle += adjustment;
    // Optional: You might want to limit the angle so the cannon doesn't point downwards
    // e.g., constrain(angle, PI/6, PI/2);
  }

  void adjustSpeed(float adjustment) {
    speed += adjustment;
    // Optional: You might want to limit the speed to reasonable values
    speed = constrain(speed, 1, 22);
  }
}

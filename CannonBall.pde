class CannonBall {
  PVector pos;
  PVector prevPos; // Store the previous position
  PVector velocity;
  int radius = 10; // Diameter of the cannonball
  int bounces = 0; // Counter for how many times the ball has bounced

  CannonBall(float x, float y, float angle, float speed) {
    pos = new PVector(x, y); // Initial position set to the firing point
    prevPos = new PVector(x, y); // Initialize previous position
    velocity = PVector.fromAngle(angle).mult(speed);
  }

  void update() {
    pos.add(velocity);
    velocity.y += 0.1; // Gravity

    // Check for collisions with the window's edges
    if (pos.x < radius || pos.x > width - radius) {
      velocity.x *= -1;
      bounces++;
    }
    if (pos.y < radius || pos.y > height - radius) {
      velocity.y *= -1;
      bounces++;
    }
  }

  void display() {
    fill(0); // Color of cannonballs
    ellipse(pos.x, pos.y, radius * 2, radius * 2); // Drawn with position and size
  }
  // Checks if the ball has bounced at least twice
  boolean hasBouncedTwice() {
    return bounces >= 2;
  }
}

// The Cannon class remains as you've written it, designed to position and fire the cannonball correctly based on the cannon's current angle and speed settings.

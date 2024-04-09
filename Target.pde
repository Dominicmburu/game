class Target {
  PVector pos; // Using PVector for 2D positioning
  int radius;
  boolean isDestroyed;
  ArrayList<CannonBall> cannonBalls; // Assuming CannonBall is a defined class

  Target(ArrayList<CannonBall> cannonBalls) {
    this.cannonBalls = cannonBalls;
    pos = new PVector((width / 2) + random(width / 2), random(height));
    radius = 25;
    isDestroyed = false;
  }

  void update() {
    // Draw concentric circles for the target
    for (int i = radius; i > 0; i -= 5) {
      fill(255, 100, 100, 150); // semi-transparent red
      ellipse(pos.x, pos.y, i * 2, i * 2);
    }

   for (CannonBall ball : cannonBalls) {
      // Line-circle intersection check
      if (lineCircleIntersect(ball.prevPos, ball.pos, this.pos, this.radius + ball.radius)) {
        isDestroyed = true;
        break; // Exit loop if collision is detected
      }
    }
  }

  // Check if a line segment intersects with a circle
  boolean lineCircleIntersect(PVector lineStart, PVector lineEnd, PVector circleCenter, float circleRadius) {
    // Simplified check: see if either end of the line segment is inside the circle
    float distToStart = PVector.dist(lineStart, circleCenter);
    float distToEnd = PVector.dist(lineEnd, circleCenter);
    return distToStart < circleRadius || distToEnd < circleRadius;
  }
}

class Stripe {
  color c;
  float y, w, h;

  Stripe(color _c, float _y, float _w, float _h) {
    c = _c;
    y = _y;
    w = _w;
    h = _h;
  }

  void display() {
    fill(c);
    rect(200, y, 400, h);
  }
}

void setup() {
  size(800, 400);

  color[] stripeColors = {
    color(255, 0, 0),    // red
    color(255, 165, 0),  // orange
    color(255, 255, 0),  // yellow
    color(0, 255, 0),    // green
    color(0, 0, 255),    // blue
    color(128, 0, 128)   // violet
  };

  float stripeHeight = height / stripeColors.length;
  Stripe[] stripes = new Stripe[stripeColors.length];
  for (int i = 0; i < stripes.length; i++) {
    float y = i * stripeHeight;
    stripes[i] = new Stripe(stripeColors[i], y, width, stripeHeight);
  }

  noStroke();
  for (Stripe stripe : stripes) {
    stripe.display();
  }
}

class Stripe {
  color c;
  float y, w, h;

  Stripe(color _c, float _y, float _w, float _h) {
    c = _c;
    y = _y;
    w = _w;
    h = _h;
  }

  void display(float x, float t, float scale) {
    float distortion = sin((y + t) * 0.05) * 10 * scale;
    fill(c);
    rect(x - distortion, y + 200, w + distortion * 2, h);
  }
}

ArrayList<Stripe[]> flags = new ArrayList<Stripe[]>();
float flagSpeed = 12; // controls horizontal movement speed
float flagScale = 1; // controls how much the flag warps
float flagTime = 1.5; // keeps track of time for wave-like motion

void setup() {
  size(1900, 800);

  color[][] stripeColors = {
    { color(255, 0, 0),    // red
      color(255, 165, 0),  // orange
      color(255, 255, 0),  // yellow
      color(0, 255, 0),    // green
      color(0, 0, 255),    // blue
      color(128, 0, 128) }, // violet
    
     { color(255, 0, 0),    // red
      color(255, 165, 0),  // orange
      color(255, 255, 0),  // yellow
      color(0, 255, 0),    // green
      color(0, 0, 255),    // blue
      color(128, 0, 128) }, // violet
  
  };

  float stripeHeight = height / 2.0 / stripeColors[0].length;
  float flagWidth = width / 7.0;
  for (int i = 0; i < 10; i++) {
    Stripe[] stripes = new Stripe[stripeColors[i % stripeColors.length].length];
    for (int j = 0; j < stripes.length; j++) {
      float y = j * stripeHeight;
      stripes[j] = new Stripe(stripeColors[i % stripeColors.length][j], y, flagWidth, stripeHeight);
    }
    flags.add(stripes);
  }

}

void draw() {
  background(100);

  float flagWidth = width / 5.0;
  for (int i = 0; i < flags.size(); i++) {
    Stripe[] stripes = flags.get(i);
    float flagX = i * flagWidth + flagTime * flagSpeed;
    for (Stripe stripe : stripes) {
      stripe.display(flagX, flagTime, flagScale);
    }
  }

  flagTime += 0.1; // increment time for wave-like motion
}

public class Particle{
  PVector position;
  
  float starSize;
  
  float velocity;
  
  color c;
  int r, g, b, alpha;
  
  void render(){
    if(position.y > height+starSize*2 || position.y < 0-starSize){
      return;
    }
    noStroke();
    
    fill(r, g, b, alpha);
    ellipse(position.x, position.y, starSize, starSize);
    
  }
  
  void move(){
    if(position.y > height+starSize){
      position.y = 0-random(0,height/2);
      position.x = random(0, width);
    }
    
    position.y += velocity;
  }
  
  Particle(PVector sPosition, float sVelocity, int sLength, int sSizeLow, int sSizeHigh, int sRed, int sGreen, int sBlue, int sAlpha){
    position = sPosition;
    
    starSize = random(sSizeLow, sSizeHigh);
    velocity = sVelocity;
    r = sRed;
    g = sGreen;
    b = sBlue;
    alpha = sAlpha;
  }
}

// snowflakes
int noSnowFlakes = 150;
Particle snowFlakes[] = new Particle[noSnowFlakes];
PVector temp;
void initSnow(){
  for(int i=0; i< noSnowFlakes; ++i){
    temp = new PVector(random(0, width), random(0, height+height/2));
    snowFlakes[i] = new Particle(temp, random(1, 5), 25, 3, 9, 255, 255, 255, int(random(100,255)));
  }
}

// snowflakes
int noStars = 150;
Particle stars[] = new Particle[noStars];
void initStars(){
  for(int i=0; i< noSnowFlakes; ++i){
    temp = new PVector(random(0, width), random(0, height+height/2));
    stars[i] = new Particle(temp, 0, 25, 1, 5, int(random(190, 255)), int(random(190, 255)), int(random(190, 255)), int(random(100,255)));
  }
}

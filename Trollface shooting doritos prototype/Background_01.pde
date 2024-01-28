
public class Star{
  PVector position;
  
  float starLength;
  float starWidth;
  
  float velocity;
  
  color c;
  int r, g, b, alpha;
  
  void render(){
    if(position.y > height+starLength*2 || position.y < 0-starLength){
      return;
    }
    noStroke();
    
    // ideja: padaryt powerupa, kuris padarytu kad varytum sviesos greiciu
    //light travel
    if(lightSpeed){
      fill(r, g, b, alpha/5*2);
      ellipse(position.x + shiftX, position.y - 20+shiftY, starWidth-1, starLength-1);
      fill(r, g, b, alpha/5*3);
      ellipse(position.x + shiftX, position.y - 10+shiftY, starWidth-0, starLength-0);
      fill(r, g, b, alpha);
      ellipse(position.x + shiftX, position.y + shiftY, starWidth, starLength);
    }
    //slow travel
    else{
      fill(r, g, b, alpha);
      ellipse(position.x + shiftX, position.y + shiftY, starWidth, starWidth);
    }
  }
  
  void move(){
    if(paused == true){return;}
    if(position.y > height+starLength){
      position.y = 0-starLength-random(0,height/2);
      position.x = random(0, width);
    }
    
    position.y += velocity;
  }
  
  Star(PVector sPosition, float sVelocity, int sLength, int sWidthLow, int sWidthHigh, int sRed, int sGreen, int sBlue, int sAlpha){
    position = sPosition;
    
    starLength = sLength;
    starWidth = random(sWidthLow, sWidthHigh);
    velocity = sVelocity;
    r = sRed;
    g = sGreen;
    b = sBlue;
    alpha = sAlpha;
  }
}

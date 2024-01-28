
public class Player{
  int playerWidth;
  int playerHeight;
  
  PVector position;
  PVector velocity;
  
  boolean movingUP = false;
  boolean movingDOWN = false;
  boolean movingRIGHT = false;
  boolean movingLEFT = false;
  
  boolean shooting = false;
  int projectileType;
  
  int shots;
  //float delay = frameRate/6;
  float timer = 0;
  
  void shoot(){
    
    println("shots: " + shots);
      println("timer: " + timer);
    
    if(timer <= 0){
      //projectiles[shots].
      println("Player SHOOTING");
      projectiles[shots].reset(projectileType);
      projectiles[shots].position.x = this.position.x + (this.playerWidth - projectiles[shots].Width) / 2;
      projectiles[shots].position.y = this.position.y;
      projectiles[shots].active = true;
      
      timer = projectiles[shots].delay;
      ++shots;
    }
    
    ++shots;
    if(shots >= maxProjectiles) shots = 0;
    
    //println("shots: "+ shots);
    
    
  }
  
  void checkBounds(){
    if(frameCount % 30 == 0) println("Player Coordinates: (" + position.x + " ; " + position.y + ")");
    if(position.y <= 0){
      movingUP = false;
    }
    if(position.y >= height-playerHeight){
      movingDOWN = false;
    }
    if(position.x >= width){
      //movingRIGHT = false;
      position.x -= width+playerWidth;
    }
    if(position.x <= 0-playerWidth){
      //movingLEFT = false;
      position.x += width+playerWidth;
    }
  }
  

  void update(){
    // player movement
    if(movingUP)      position.y -= velocity.y;
    if(movingDOWN)    position.y += velocity.y;
    if(movingRIGHT)   position.x += velocity.x;
    if(movingLEFT)    position.x -= velocity.x;
    
    // drawing player
    //fill(255);
    //rect(position.x + shiftX, position.y + shiftY, playerWidth, playerHeight);
    //fill(100);
    //rect(position.x + shiftX+5, position.y + shiftY+5, playerWidth - 10, playerHeight - 10);
    image(trollface, position.x + shiftX, position.y + shiftY, playerWidth, playerHeight);
    
    // shooting
    if(shooting) shoot();
    if(timer > 0) --timer;
  }
  void startPosition(){
    position.x = (width-playerWidth)/2;
    position.y = (height-playerHeight)/1.1;
  }
  
  
  Player(int projectType){
    projectileType = projectType;
    playerWidth = 60;
    playerHeight = 60;
    
    position = new PVector(0, 0);
    velocity = new PVector(10, 10);
    velocity.x = velocity.x/frameRate*60;
    velocity.y = velocity.y/frameRate*60;
    ///frameRate*60
  }
}

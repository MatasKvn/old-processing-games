
public class Projectile{
  boolean active;
  int penetration;
  int noTypes = 2;
  int type;
  
  PVector position;
  PVector velocity;
  
  int Height;
  int Width;
  
  float damage;
  float delay; // how many projectiles per second
  
  Projectile(PVector pPosition, int pType){
    type = pType;
    position = pPosition;
    
    if(type == 0){  // dorito
      Width = 50;
      Height = 50;
      delay = frameRate/10;
      this.penetration = 1;
      this.velocity = new PVector(0, -25);
      this.damage = 5;
    }
    
    if(type == 1){
      Width = 100;
      Height = 20;
      delay = frameRate/2;
      this.penetration = 10;
      this.velocity = new PVector(0, -50);
      this.damage = 35;
    }
  }
  
  void reset(int pType){
    type = pType;
    
    if(type == 0){  // dorito
      Width = 50;
      Height = 50;
      delay = frameRate/10;
      this.penetration = 1;
      this.velocity = new PVector(0, -25);
      this.damage = 5;
    }
    
    if(type == 1){
      Width = 100;
      Height = 20;
      delay = frameRate/4;
      this.penetration = 10;
      this.velocity = new PVector(0, -50);
      this.damage = 35;
    }
  }
  
  void update(){
    if(position.y <= 0-Height*2) this.active = false;
    if(active){
      
      if(paused == false) position.add(velocity);
      //fill(255, 0, 0, 100);
      //rect(position.x + shiftX, position.y + shiftY, Width, Height);
      if(type == 0) updateType_0();
      if(type == 1) updateType_1();
    }
    if(this.penetration <= 0) this.active = false;
  }
  
  void updateType_0(){
    image(dorito, position.x + shiftX, position.y + shiftY, Width, Height);
  }
  void updateType_1(){
    image(dorito, position.x + shiftX, position.y + shiftY, Width, Height);
  }
}


public class Player{
  PVector pos;
  PVector velocity;
  PVector acceleration;
  
  PVector size;
  
  boolean JUMPING;
  boolean movingRIGHT;
  boolean movingLEFT;
  boolean airborne;
  
  boolean facingRight;
  
  float sprite;
  
  //collision
  float ground;
  float ceiling;
  float wallLeft;
  float wallRight;
  
  
  
  Player(float x, float y, float Width, float Height){
    this.pos = new PVector(x, y);
    this.size = new PVector(Width, Height);
    this.velocity = new PVector(7.5, 0);  // horizontal movement
    this.acceleration = new PVector(0, -gravity.y*20.5);  // jump strength
    sprite = 0;
    facingRight = true;
    
    ground = height;
    ceiling = 0;
    
    wallLeft = 0;
    wallRight = tile_width*(map_width-1); 
  }
  
  void die(){
    menuText = "You died";
    levelNumber = '1';
    startMenu = true;
    gamePaused = true;
    level.setCharAt(3, levelNumber);
    loadMap(""+level);
  }
  
  void render(){
    //fill(255,255,255,100);
    if(facingRight == true){
      if(this.airborne == true){
        image(p_sprite_airborne_right,pos.x + screenPosX, pos.y, size.x, size.y);
      }else{
        image(p_sprite_right[int(sprite)],pos.x + screenPosX, pos.y, size.x, size.y);
      }
    }else{
      if(this.airborne == true){
        image(p_sprite_airborne_left,pos.x + screenPosX, pos.y, size.x, size.y);
      }else{
        image(p_sprite_left[int(sprite)],pos.x + screenPosX, pos.y, size.x, size.y);
      }
    }
    sprite += frameRate/30*0.009;
    if(sprite >= 2) sprite = 0;
  }
  
  void move(){
    checkCollisionX();
    checkCollisionY();
    if(this.movingRIGHT == true){ 
      pos.x += velocity.x; 
      facingRight = true;
      sprite += frameRate/30*0.1;
    }
    if(this.movingLEFT == true){
      pos.x -= velocity.x; 
      facingRight = false;
      sprite += frameRate/30*0.1;
    }
    if(sprite >= 2) sprite = 0;
    
      //if(this.JUMPING == true) pos.y += 10;  // temp
      this.pos.y += velocity.y; // falling
    
    if(this.pos.y >= ground-this.size.y){    //check if player is on ground
      this.airborne = false;
      this.pos.y = ground-this.size.y;
      this.velocity.y = 0;
      
      
      
      
      if(this.JUMPING == true) velocity.y = acceleration.y;  // jump
    }else{
      this.velocity.y += gravity.y;
      this.airborne = true;
      
      //pseudoCode
      if(pseudoMovement == true){
        JUMPING = false;
      }
      
    }
    
  }
  
  
  void checkCollisionX(){
    int a = 0; 
    int b = 0; 
    
    //collision left
    if(this.pos.x >= tile_width){
      a = int(this.pos.y/tile_height)*map_width + int(this.pos.x/tile_width) - 1;
      b = int((this.pos.y+this.size.y-1)/tile_height)*map_width + int(this.pos.x/tile_width) -1;
      if(tiles[a].colidable == true || tiles[b].colidable == true){
        //tiles[a].texture = grass;
        //tiles[b].texture = blackstone;
        wallLeft = ((tiles[a].colidable == true) ? tiles[a].pos.x : tiles[b].pos.x) + tile_width;
      }
      else{
        wallLeft = 0;
      }
    }
    
    //collision right
    if(this.pos.x < tile_width*map_width-player.size.x){
      a = int(this.pos.y/tile_height)*map_width + int(this.pos.x/tile_width) +1;
      b = int((this.pos.y+this.size.y-1)/tile_height)*map_width + int(this.pos.x/tile_width) +1;
      if(tiles[a].colidable == true || tiles[b].colidable == true){
        //tiles[a].texture = grass;
        //tiles[b].texture = blackstone;
        wallRight = ((tiles[a].colidable == true) ? tiles[a].pos.x : tiles[b].pos.x)-1;
      }
      else{
        wallRight = tile_width*(map_width-1);
      }
    }
    //println(a + " " + b);
    //println("Wall: " + wallLeft);
    
    if(movingRIGHT == true && this.pos.x+this.size.x + this.velocity.x>= wallRight){
      this.pos.x = wallRight-this.size.x - this.velocity.x;
    }
    if(movingLEFT == true && this.pos.x - this.velocity.x <= wallLeft){
      this.pos.x = wallLeft + this.velocity.x;
    }
  }
  
  
  
  
  void checkCollisionY(){  ///
    //println("Player coordinates: (" + player.pos.x + ";" + player.pos.y + ")");
    //println("Tile left: " + int(player.pos.x/tile_width) + " " + int(player.pos.y/tile_height));
    int a = int(this.pos.x/tile_width) + int(this.pos.y/tile_height+1)*map_width;  // left tile
    int b = int((this.pos.x+this.size.x)/tile_width) + int(this.pos.y/tile_height+1)*map_width;  // right tile
    //tiles[a].texture = grass;
    //tiles[b].texture = blackstone;
    if(tiles[a].colidable == true || tiles[b].colidable == true){
      ground = (tiles[a].colidable == true) ? tiles[a].pos.y : tiles[b].pos.y;
      
      // damaging tiles
      if(tiles[a].damaging == true || tiles[b].damaging == true){
        player.die();
      }
    }else if(tiles[a].colidable == false || tiles[b].colidable == false){
      ground = height;
    }
    //println(ground);
    //println(int(player.pos.x/tile_width) + " " + int(player.pos.y/tile_height) + " " + a);
    
    // check map ceiling collision
    if(this.pos.y + this.velocity.y <= ceiling){
      this.pos.y = ceiling+1 - this.velocity.y;
      //this.velocity.y = 0;  // bounce back from ceiling
    }
    
    a = int(this.pos.x/tile_width) + int(this.pos.y/tile_height-1)*map_width;  // left tile
    b = int((this.pos.x+this.size.x)/tile_width) + int(this.pos.y/tile_height-1)*map_width;  // right tile
    //println(a + " " + b);
    if(tiles[a].colidable == true || tiles[b].colidable == true){
      ceiling = ((tiles[a].colidable == true) ? tiles[a].pos.y : tiles[b].pos.y) + tile_height;
    }else{
      ceiling = 0;
    }
    
    
  }
  
  
}

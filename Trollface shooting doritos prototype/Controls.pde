int o = 0;
boolean devControls = false;
void keyPressed(){
  //TEMP
  // change ammo type
  if(keyCode == 'O' && devControls){
    ++player.projectileType;
    if(player.projectileType > projectiles[0].noTypes-1) player.projectileType = 0;
  }
  // activate enemy
  if(keyCode == 'I' && devControls){
    if(e1.active == false){
      temp = new PVector(200,200);
      temp1 = new PVector(5,2.5);
      e1 = new Enemy(0, temp, temp1, 50, 50);
      e1.setActivity(true);
    }
  }
  
  if(keyCode == 'L'){
    lightSpeed = !lightSpeed;
    if(lightSpeed){
      for(int i=0; i<numberOfStars; ++i){
        starArray[i].velocity *= 15;
      }
    }else{
      for(int i=0; i<numberOfStars; ++i){
        starArray[i].velocity /= 15;
      }
    }
  }
  
  if(keyCode == 'R'){
    redShift = !redShift;
    if(redShift == true){
      for(int i=0; i< numberOfStars; ++i){
        starArray[i].r = 0;
        starArray[i].g = 0;
        starArray[i].b = 200;
      }
    }else{
      for(int i=0; i< numberOfStars; ++i){
        starArray[i].r = int(random(210, 255));
        starArray[i].g = int(random(210, 255));
        starArray[i].b = int(random(210, 255));
      }
    }
  }
  
  // pause menu
  if(keyCode == 'P'){
    paused = !paused;
  }
  if(paused == true){
    return;
  }
  
  // Player
  if(keyCode == 'W') player.movingUP = true;
  if(keyCode == 'A') player.movingLEFT = true;
  if(keyCode == 'S') player.movingDOWN = true;
  if(keyCode == 'D') player.movingRIGHT = true;
  if(keyCode == 'V') player.shooting = true;
  
  
  // dev controls
  if(keyCode == 'M') devControls = true;
  
  // screen shift
  if(keyCode == LEFT)  shiftX += 100;
  if(keyCode == RIGHT) shiftX -= 100;
  if(keyCode == UP)    shiftY += 100;
  if(keyCode == DOWN)  shiftY -= 100;
}




void keyReleased(){
  
  // Player
  if(keyCode == 'W') player.movingUP = false;
  if(keyCode == 'A') player.movingLEFT = false;
  if(keyCode == 'S') player.movingDOWN = false;
  if(keyCode == 'D') player.movingRIGHT = false;
  if(keyCode == 'V') player.shooting = false;
  
  // dev controls
  if(keyCode == 'M') devControls = false;
  
  if(keyCode == '0'){
    shiftX = 0;
    shiftY = 0;
  }
}



/*
CONTROLS:
P - pause
0 - center Screen

WASD - movement
Arrow keys - screen movement (100 pixels)
k - light speed
v - shoot


*/
/*
IDEJOS:
padaryti, kad skirtingi leveliai vyksta skirtingose galaktikose ( skirtingi backgoundai), kai kurie gal niekur


*/

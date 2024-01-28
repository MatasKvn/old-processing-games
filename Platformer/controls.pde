


//WAS - movement
//] - pause
//[ + levelNumber - select level

//; - toggle pseudoCode movement
//  UP - jump
//  RHT/x - moves right x times
//  LFT/x - moves left x times
//  TP/x/y - teloports the player x tiles left and y tiles up
//  separated by , for multiple movement commands
//  
  
//0 - lock screen to player
//9 - teleport player to cursor
//- - move screen left
//= - move screen right




boolean screenLocked = true;
void moveScreen(){
  if(screenLocked == true && player.pos.x >= width*0.4 && player.pos.x < map_width*tile_width-width*0.6){
    screenPosX = -player.pos.x + width*0.4;
  }
}

boolean levelSelect;
void keyPressed(){
  
  // level selection
  if(keyCode == '[') levelSelect = true;
  if(keyCode == '1' && levelSelect == true) levelNumber = '1';
  if(keyCode == '2' && levelSelect == true) levelNumber = '2';
  if(keyCode == '3' && levelSelect == true) levelNumber = '3';
  //if(keyCode == '4' && levelSelect == true) levelNumber = '4';
  //if(keyCode == '5' && levelSelect == true) levelNumber = '5';
  
  
  //toggle pseudo code movement ( commands: UP,RHT/50,LFT/30,TP/13/5 - separated by ',', '/' to specify ammount)
  if(keyCode == ';'){
    pseudoMovement = !pseudoMovement;
  }
  
  //movement
  if(pseudoMovement == false){
    cp5.getController("command line").hide();
  if(keyCode == 'W' && levelEnd == false) player.JUMPING = true;
  if(keyCode == 'A' && levelEnd == false) player.movingLEFT = true;
  if(keyCode == 'D' && levelEnd == false) player.movingRIGHT = true;
  }
  
  //dev controls
  if(keyCode == '0') screenLocked = true;
  if(keyCode == '9'){ player.pos.x = mouseX-screenPosX; player.pos.y = mouseY;}
  if(keyCode == '-'){ screenLocked = false; screenPosX += 40;}
  if(keyCode == '='){ screenLocked = false; screenPosX -= 40;}
  
  //pausemenu
  if(keyCode == ']'){
    gamePaused = !gamePaused;
    startMenu = false;
  }
  
  //editor
  if(keyCode == 'E'){
    editor = !editor;
    if(editor == false){
      saveMap(""+level);
    }
  }
  if(editor == true){
    if(keyCode == RIGHT) if(selectedTile < map_width*(map_height-1)-1) selectedTile += 1;
    if(keyCode == LEFT) if(selectedTile >= 1) selectedTile -= 1;
    if(keyCode == UP) if(selectedTile >= map_width) selectedTile -= map_width;
    if(keyCode == DOWN) if(selectedTile <= map_width*(map_height-2)-1) selectedTile += map_width;
    
    if(keyCode == 'T'){
      ++newTileType;
      if(newTileType >= numberOfTiles) newTileType = 0;
    }
    if(keyCode == 'R') tiles[selectedTile].changeType(newTileType);
  }
  
  
  
  
}

void keyReleased(){
  if(keyCode == 'W') player.JUMPING = false;
  if(keyCode == 'A') player.movingLEFT = false;
  if(keyCode == 'D') player.movingRIGHT = false;
  
  if(keyCode == '['){
    level.setCharAt(3, levelNumber);
    loadMap(""+level);
  }
  
}

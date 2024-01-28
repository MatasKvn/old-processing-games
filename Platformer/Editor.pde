boolean editor;
int selectedTile = 0;
int newTileType = 0;

void editor(){
  if(startMenu == false)
    drawEditorMenu();
}

void drawEditorMenu(){
  int temp;
  if(gamePaused == false){
    fill(0,0,0,150);
    rect(0,0,width,height);
  }
  if(newTileType != 0){
    image(tile_texture[newTileType], 0, 0, 150, 150);
  }else{
    fill(0,0,0,255);
    rect(0,0,150,150);
  }
  strokeWeight(5);
  stroke(0,255,0);
  rect(0,0,150,150);
  
  strokeWeight(1);
  stroke(255);
  
  //drawing minimap for editor
  for(int row = 0; row < map_height-1; ++row){
    for(int col = 0; col < map_width; ++col){
      temp = row*map_width + col;
      println("temp: " + temp);
      if(tiles[temp].texture != null) image(tiles[temp].texture ,col*width/map_width, (height-width/map_width*(map_height-1))+row*width/map_width, width/map_width, width/map_width);
      
      // selection box
      if(selectedTile == temp){
        fill(0,0,0,0);
        strokeWeight(3);
        stroke(255,0,0,255);
        rect(col*width/map_width, (height-width/map_width*(map_height-1))+row*width/map_width, width/map_width, width/map_width);
        strokeWeight(1);
        stroke(255);
      }
    }
    
  }
  
  //information text
  textSize(25);
  textAlign(LEFT);
  fill(255);
  text("'T' - change tile\n'R' - replace tile\n'E' - close editor & save", width-300, 50);
  
  //level info
  textSize(50);
  textAlign(LEFT);
  fill(255);
  text("Level: " + level, width/3, 100);
  
}

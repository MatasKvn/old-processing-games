


int map_width; // number of tiles
int map_height;

Tile[] tiles; 

PrintWriter output;
void saveMap(String fileName){
  output = createWriter("Resources/maps/" + fileName);
  for(int row = 0; row < map_height; ++row){
    
    for(int col = 0; col < map_width; ++col){
      output.print(tiles[map_width*row + col].type);
      if(col != map_width-1){
        output.print(";");
      }
    }
    output.println();
  }
  output.flush();
  output.close();
}

void loadMap(String fileName){
  String[] lines = loadStrings("Resources/maps/" + fileName);
  String[] temp = split(lines[0], ";");
  //map_height = lines.length;
  map_height = 9 + 1;  // map height is 9 tiles + row of tiles below screen(for player collision)
  map_width = temp.length;

  
  tiles = new Tile[map_width * map_height];
  for(int i = 0; i < map_width * map_height; ++i){
    tiles[i] = null;
  }
  
  for(int row = 0; row < map_height; ++row){
    temp = split(lines[row], ";");
    
    for(int col = 0; col < map_width; ++col){
      tiles[map_width*row + col] = new Tile(int(temp[col]), tile_height*col, tile_width*row);
    }
  }
  //for(int row = 0; row < map_height; ++row){
  //  temp = split(lines[row], ";");
    
  //  for(int col = 0; col < map_width; ++col){
  //    println("[" + (row*map_width+col) + "]" + tiles[map_width*row + col].type + " x: " + tiles[map_width*row + col].pos.x + " y: " + tiles[map_width*row + col].pos.y);
      
  //  }
  //  println();
  //}
  
  // set player position
  player.pos.x = 0;
  player.pos.y = (map_height-5) * tile_height + (tile_height-player.size.y);
  screenPosX = 0;
  
}




public class Tile{
  PImage texture;
  int type;
  
  PVector pos;
  PVector size;
  
  boolean colidable;
  boolean damaging;
  
  
  Tile(int type, float x, float y){
    this.type = type;
    pos = new PVector(x, y);
    size = new PVector(tile_width, tile_height);
    damaging = false;
    
    if(type == 0){
      colidable = false;
      texture = tile_texture[type];
    }else if(type == 6){
      damaging = true;
      colidable = true;
      texture = tile_texture[type];
    }else{
      colidable = true;
      texture = tile_texture[type];
    }
  }
  
  void changeType(int newType){
    type = newType;
    if(type == 0){
      colidable = false;
      texture = tile_texture[type];
    }else if(type == 6){
      damaging = true;
      colidable = true;
      texture = tile_texture[type];
    }else{
      colidable = true;
      texture = tile_texture[type];
    }
  }
  
  void render(){
    if(type != 0){
      if(pos.x + screenPosX < width && pos.x + screenPosX > -tile_width){  // only render while onscreen
        image(texture, pos.x + screenPosX, pos.y, size.x, size.y);
      }
    }
  }
}

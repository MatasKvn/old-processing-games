
PImage[] p_sprite_left = new PImage[2];
PImage[] p_sprite_right = new PImage[2];
PImage p_sprite_airborne_left;
PImage p_sprite_airborne_right;

PImage mainScreen;

int numberOfTiles = 10;
PImage[] tile_texture = new PImage[numberOfTiles];

void loadTextures(){
  // player
  p_sprite_left[0] = loadImage("Resources/player/facing_left_1.png");
  p_sprite_left[1] = loadImage("Resources/player/facing_left_2.png");
  p_sprite_airborne_left = loadImage("Resources/player/facing_left_airborne.png");
  p_sprite_right[0] = loadImage("Resources/player/facing_right_1.png");
  p_sprite_right[1] = loadImage("Resources/player/facing_right_2.png");
  p_sprite_airborne_right = loadImage("Resources/player/facing_right_airborne.png");
  
  //mainscreen
  mainScreen = loadImage("resources/misc/cover.png");
  //tiles
  
  //air
  tile_texture[0] = null;
  //solids
  tile_texture[1] = loadImage("Resources/tiles/snow.png");
  tile_texture[2] = loadImage("Resources/tiles/snowy_grass.png");
  tile_texture[3] = loadImage("Resources/tiles/dirt.png");
  tile_texture[4] = loadImage("Resources/tiles/glowstone.png");
  tile_texture[5] = loadImage("Resources/tiles/glass.png");
  tile_texture[6] = loadImage("Resources/tiles/lava.png");
  tile_texture[7] = loadImage("Resources/tiles/snow_smooth.png");
  tile_texture[8] = loadImage("Resources/tiles/snow_smooth_left.png");
  tile_texture[9] = loadImage("Resources/tiles/snow_smooth_right.png");
  //background
}

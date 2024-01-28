
PImage trollface;
PImage dorito;
int numberOfStars = 250;
int maxProjectiles = 250;

float shiftX = 0;
float shiftY = 0;
boolean lightSpeed = false;
boolean redShift = false;
PVector temp, temp1, tempVector;

Player player = new Player(0);
Star starArray[] = new Star[numberOfStars];
Projectile projectiles[] = new Projectile[maxProjectiles];
Enemy e1;

boolean paused = false;

void setup(){  ////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
  size(1280, 720);
  //fullScreen();
  frameRate(60);
  cursor(CROSS);
  trollface = loadImage("Resources/trollface.png");
  dorito = loadImage("Resources/dorito.png");
  
  // enemies
  temp = new PVector(200,200);
  temp1 = new PVector(5,2.5);
  e1 = new Enemy(0, temp, temp1, 50, 50);
  e1.setActivity(true);
  
  // initialize projectiles
  for(int i=0; i < maxProjectiles; ++i){
    temp = new PVector(width,0);
    temp1 = new PVector(0, -25);
    projectiles[i] = new Projectile(temp, 0);
  }
  
  // initialize each star object
  for(int i=0; i< numberOfStars; ++i){
    temp = new PVector(random(0, width), random(0, height+height/2));
    starArray[i] = new Star(temp, random(0.1, 0.5), 25, 3, 9, int(random(210, 255)), int(random(210, 255)), int(random(210, 255)), 255);
  }
  player.startPosition();
}



void draw(){  /////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
  background(0,0,0);
  
  render();
  

  if(paused == true){
    fill(0,0,0,150);
    rect(0,0,width,height);
    textSize(100);
    fill(255);
    textAlign(CENTER);
    text("Game Paused", 1280/2, 720/2);
  }
}




void render(){
  // drawing stars
  for(int i=0; i < numberOfStars; ++i){
    starArray[i].move();
    starArray[i].render();
  }
  
  // drawing projectiles
  for(int i=0; i < maxProjectiles; ++i){
    projectiles[i].update();
  }

  // drawing player
  player.checkBounds();
  player.update();
  
  // drawing enemies
  e1.update();
  e1.checkColision();
  
  
}

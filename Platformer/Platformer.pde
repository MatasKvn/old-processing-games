import controlP5.*;
import java.util.Queue;
import java.util.LinkedList;


float screenPosX;
StringBuilder level = new StringBuilder("lvl1.csv");
char levelNumber = '1';
char noLevels = '3';

float width = 1280;
float height = 720;
float frameRate = 60;
PVector gravity = new PVector(0, frameRate/120*1.5); //0.75


float tile_height = height/9;
float tile_width = tile_height;
Player player = new Player(0, 0, tile_width/4*3, tile_height/4*3);

ControlP5 cp5;
Textfield textField;
Queue<String> moveQueue;


void setup()
{
 
  cp5 = new ControlP5(this);
  
  PFont myFont = createFont("Calibri", 24);
   
  moveQueue = new LinkedList<>();
  textField = cp5.addTextfield("command line")
     .setPosition(20, 110)
     .setSize(500, 30) 
     .setColor(color(255, 255, 255))
     .setColorActive(color(0, 255, 0))
     .setColorForeground(color(255, 255, 255))
     .setFont(myFont);
  
  textField.addListener(new ControlListener() {
  public void controlEvent(ControlEvent theEvent) {
    if (theEvent.getController().getName().equals("command line")) {
      String inputText = textField.getText();
      
       String[] moves = inputText.split(",");
      for (String move : moves) {
        moveQueue.add(move);
      }
      textField.setText("");  // Clear the input field
    }
  }
});
  
  println("Gravity: " + gravity.y);
  size(1280, 720);
  frameRate(frameRate);
  loadTextures();
  initSnow();
  initStars();
  loadMap(""+level);
  cp5.getController("command line").hide();
  pseudoMovement = false;
  
}

void draw()
{
  background(0);
  
  renderBackground();
  
  
  // drawing tiles
  for(int row = 0; row < map_height; ++row){
    for(int col = 0; col < map_width; ++col){
      tiles[row*map_width+col].render();
    }
  }
  player.render();
  if(pseudoMovement == true) pseudoCodeMove();
  moveScreen();
  if(gamePaused == false) player.move();
  if(gamePaused == true) pause();
  checkIfEnd();
  if(editor == true) editor();
  
  
}


//pseudoCode
boolean nextCommand = true;
String nextMove;
boolean pseudoMovement = true;
int counterR = 0;
int counterL = 0;

void pseudoCodeMove(){
  if(gamePaused == true) 
  {
    cp5.getController("command line").hide();
   
  }else{
    cp5.getController("command line").show();
  }
  
  for(String s : moveQueue){
    println(s.toString());
  }
  
  
  if(counterR > 0){
    counterR--;
    player.movingRIGHT = true;
    println("mov RHT");
  }else{
    player.movingRIGHT = false;
    nextCommand = true;
  }
  
  if(counterL > 0){
    counterL--;
    player.movingLEFT = true;
    println("mov LFT");
  }else{
    player.movingLEFT = false;
    nextCommand = true;
  }
  
  if (!moveQueue.isEmpty() && nextCommand == true && counterL == 0 && counterR == 0) {
            nextMove = moveQueue.poll();
            String[] temp = nextMove.split("/");
            
            //movement
            if(nextMove.equals("UP")){
              player.JUMPING = true;
              nextCommand = false;
            } 
            if(temp[0].equals("RHT")){
              int t = Integer.parseInt(temp[1]);
              counterR = t;
              nextCommand = false;
            } 
            if(temp[0].equals("LFT")){
              int t = Integer.parseInt(temp[1]);
              counterL = t;
              nextCommand = false;
            }
            
            if(temp[0].equals("TP")){
              int x = Integer.parseInt(temp[1]);
              int y = Integer.parseInt(temp[2]);
              player.pos.x = player.pos.x + x*tile_width; 
              player.pos.y = player.pos.y + -y*tile_height;
            }
   } 
}

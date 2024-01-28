boolean gamePaused = true;
boolean startMenu = true;
Button button_start = new Button(width/2, height/2, 50, "Start", color(255,255,255,100));
Button button_resume = new Button(width/2, height/2, 50, "Resume", color(255,255,255,100));
String menuText = "Sniegius: Iškilimas";

void pause(){
  
  if(startMenu == true){
    image(mainScreen, 0, 0, width, height);
    stroke(0,0,0,255);
    strokeWeight(20);
    textSize(100);
    textAlign(CENTER);
    fill(255);
    text(menuText, width/2, height/3);
    button_start.render_startButton();
  }else{
    fill(0, 0, 0, 150);
    rect(0, 0, width, height);
    if(editor == false){
      textSize(100);
      textAlign(CENTER);
      fill(255,255,255,255);
      text("Game paused", width/2, height/3);
      button_resume.render_resumeButton();
    }
  }
  
  
}





class Button{
  PVector pos;
  PVector size;
  
  String text;
  PImage texture;
  color textColor;
  
  Button(float posX, float posY, float w, String text, color col){
    textColor = col;
    this.text = text;
    size = new PVector(text.length()*w/2, w);
    pos = new PVector(posX-size.x/2, posY-size.y/2);
  }
  
  void render(){
    fill(textColor);
    textSize(size.y);
    textAlign(CENTER);
    text(text, pos.x+size.x/2, pos.y+size.y/1.2);
    
    //fill(255,0,0,100);
    //rect(pos.x, pos.y, size.x, size.y);
  }
  
  void render_resumeButton(){
    render();
    if(mouseX >= pos.x && mouseX <= pos.x+size.x  &&  mouseY >= pos.y && mouseY <= pos.y+size.y){
      textColor = color(255,255,255,255);
      if(mousePressed == true){
        gamePaused = false;
      }
    }else{
      textColor = color(255,255,255,100);
    }
  }
  
  void render_startButton(){
    render();
    if(mouseX >= pos.x && mouseX <= pos.x+size.x  &&  mouseY >= pos.y && mouseY <= pos.y+size.y){
      textColor = color(255,255,255,255);
      if(mousePressed == true){
        startMenu = false;
        gamePaused = false;
      }
    }else{
      textColor = color(255,255,255,100);
    }
    
    
    
  }
}

boolean levelEnd = false;
int screenDarken1 = 0;

void checkIfEnd(){
  // level end
  if(player.pos.x >= (map_width-1)*tile_width-player.size.x-2){
    levelEnd = true;
  }
  if(levelEnd == true){
    textSize(100);
    textAlign(CENTER);
    fill(255,255,255,255);
    text("Level " + levelNumber + " completed!", width/2, height/3);
    screenDarken1 += 3;
    fill(0,0,0,screenDarken1);
    rect(0,0,width,height);
    
    //if end of last level
    if(screenDarken1 >= 255){
      ++levelNumber;
      if(levelNumber > noLevels){
        levelNumber = '1';
        level.setCharAt(3, levelNumber);
        loadMap(""+level);
        menuText = "Zaidimas";
        startMenu = true;
        gamePaused = true;
        levelEnd = false;
      }else{
        screenDarken1 = 0;
        level.setCharAt(3, levelNumber);
        loadMap(""+level);
        levelEnd = false;
      }
    }
  }
}

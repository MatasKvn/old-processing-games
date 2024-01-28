void renderBackground(){
  //update stars
  for(int i=0; i < noStars; ++i){
    stars[i].render();
  }
  
  //update snow
  for(int i=0; i < noSnowFlakes; ++i){
    if(gamePaused == false) snowFlakes[i].move();
    snowFlakes[i].render();
  }
  
  fill(170,170,170,255);
  ellipse(width-width/6, height/4, 100,100);
  
}

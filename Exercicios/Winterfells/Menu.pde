public class Menu {

  float StartButtonWidth = width*0.3;
  float StartButtonHeight = height*0.065;

  float ConfigButtonWidth = width*0.3;
  float ConfigButtonHeight = height*0.065;

  public void drawStartButton() {
    fill(200);

    rectMode(CENTER);
    rect(width/2, height/2, StartButtonWidth, StartButtonHeight);

    fill(255);

    textAlign(CENTER, CENTER);
    textSize(30);
    text("Start Game", width/2, height/2);
  }

  public void drawConfigButton() {
    fill(200);

    rectMode(CENTER);
    rect(width/2, height/2 + ConfigButtonHeight, ConfigButtonWidth, ConfigButtonHeight);

    fill(255);

    textAlign(CENTER, CENTER);
    textSize(30);
    text("Configuration", width/2, height/2 + ConfigButtonHeight);
  }

  public void onClick() {

    if (mousePressed == true) {
      if (mouseX > width/2 - StartButtonWidth/2 &&
        mouseX < width/2 + StartButtonWidth/2 && 
        mouseY > height/2 - StartButtonHeight/2 && 
        mouseY < height/2 + StartButtonHeight/2) {
        state = STATE.PLAYING;
      } else if (mouseX > width/2 - ConfigButtonWidth/2 &&
        mouseX < width/2 + ConfigButtonWidth/2 && 
        mouseY > height/2 + ConfigButtonHeight - ConfigButtonHeight/2 && 
        mouseY < height/2 + ConfigButtonHeight + ConfigButtonHeight/2) {
        state = STATE.PLAYING;
      }
    }
    
  }
  
}
import ddf.minim.*;
import ddf.minim.ugens.*;
import processing.serial.*;
import cc.arduino.*;

Minim minim;
AudioOutput out;
Arduino arduino;

int pong_game = 9;

int posX;
int posY;
int veloX = -5;
int veloY = 5;
boolean esta_colidindo = false;

void setup() {
  size(800, 600);
  posX = width/2;
  posY = height/2;
  rectMode(CENTER);
  noStroke();
  
  try {
    minim = new Minim(this);
    out = minim.getLineOut();
  } catch (Exception e) {
    println("Não foi detectado saida de audio");
  }
  
  try {
    arduino = new Arduino(this, Arduino.list()[0], 57600);
    for(int i = 13; i > 3; i--) {
      arduino.pinMode(i, Arduino.OUTPUT);
    }
  } catch (Exception e) {
    println("Não foi detectado arduino na porta 0");
  }
}

void draw() {
  if(pong_game == 1)
    classic_pong();
  else if(pong_game == 2)
    teleport_pong();
  else if(pong_game == 3)
    motion_pong();
  else if(pong_game == 4)
    invisible_pong();
  else if(pong_game == 5)
    exploding_pong();
  else if(pong_game == 6)
    illusion_pong();
  else if(pong_game == 7)
    blind_pong();
  else if(pong_game == 8)
    rotate_pong();
  else if(pong_game == 9)
    sensor_pong();
}

void resetar(int n) {
  posX = width/2;
  posY = height/2;
  veloX = -3;
  veloY = 3;
  esta_colidindo = false;
  
  pong_game = n;
}
void keyPressed() {
  if(key == '1')
    resetar(1);
  else if(key == '2')
    resetar(2);
  else if(key == '3')
    resetar(3);
  else if(key == '4')
    resetar(4);
  else if(key == '5')
    resetar(5);
  else if(key == '6')
    resetar(6);
  else if(key == '7')
    resetar(7);
  else if(key == '8')
    resetar(8);
  else if(key == '9')
    resetar(9);
}
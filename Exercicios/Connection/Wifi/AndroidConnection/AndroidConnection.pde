import netP5.*;
import oscP5.*;

OscP5 osc;
NetAddress netAddress;

int port = 17000;
String computerIP = "192.168.0.18";

String TEXT = "SUCCESS";

void setup() {
  fullScreen();
  
  osc = new OscP5(this, port);
  netAddress = new NetAddress(computerIP, port);
}

void draw() {
  background(0);
  
  OscMessage message = new OscMessage("mousePos");
  message.add(mouseX);
  message.add(mouseY);
  osc.send(message, netAddress);
  
  text(TEXT, width/2, height/2);
}

void oscEvent(OscMessage theOscMessage) {
  int x = 0, y = 0;
  
  if(theOscMessage.checkTypetag("ii")) {
    x = theOscMessage.get(0).intValue();
    y = theOscMessage.get(1).intValue();
  }
  
  TEXT = "x = " + x + ", y = " + y;
}
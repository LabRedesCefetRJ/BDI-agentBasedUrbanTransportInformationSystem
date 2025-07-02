#include <Javino.h> // https://javino.chon.group
Javino javino;

const byte pins[] = {2,3,4,5,6,7,8,9,10,11};
const int btnN = sizeof(pins)/sizeof(pins[0]);
boolean destinations[btnN] = {false};

void setup() {
 for (int i=0; i<btnN; i++) pinMode(pins[i], INPUT);
  javino.perceive(getPercepts);
  javino.start(9600);
}

void serialEvent(){javino.readSerial();}
void loop(){javino.run(); btnPressed();}

void btnPressed() {
 for (int i = 0; i < btnN; i++)
  if(digitalRead(pins[i]) == HIGH)
   destinations[i] = true;
}

void getPercepts() {
 javino.addPercept("device(busPoint)");
 for (byte i = 0; i < btnN; i++)
  if(destinations[i]) 
   javino.addPercept("dest("+ String(i+1)+")");
 memset(destinations, 0, sizeof(destinations));
}
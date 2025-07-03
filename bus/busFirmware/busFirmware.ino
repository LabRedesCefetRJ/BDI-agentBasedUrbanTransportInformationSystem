#include <SoftwareSerial.h>
#include <TinyGPS++.h> // https://docs.arduino.cc/libraries/tinygpsplus/
#include <Javino.h> // https://javino.chon.group
Javino javino;

SoftwareSerial gpsSerial(10, 11); // RX 10, TX 11
TinyGPSPlus gps;

boolean in = false;
boolean out = false;
boolean stop = false;

void setup() {
pinMode(2, INPUT); //in
pinMode(3, INPUT); //out
pinMode(4, INPUT); //stop
gpsSerial.begin(9600);
javino.perceive(getPercepts);
javino.start(9600);
}

void serialEvent(){javino.readSerial();}

void loop(){
	javino.run(); 
	getRawData();
	gpsReader();
}

void getRawData(){
 if(digitalRead(2) == HIGH) in = true;
 if(digitalRead(3) == HIGH) out = true;
 if(digitalRead(4) == HIGH) stop = true;
   else stop=false;
}

void getPercepts(){
 javino.addPercept("device(bus)");
 if(gps.location.isValid()) {
	javino.addPercept("latitude("+String(gps.location.lat(), 6)+")");
	javino.addPercept("longitude("+String(gps.location.lng(), 6)+")");
 }
 if(in) javino.addPercept("passager(in)");
 if(out) javino.addPercept("passager(out)");
 if(stop) javino.addPercept("bus(stopped)");
 else javino.addPercept("bus(running)");
}


void gpsReader() {
  while (gpsSerial.available() > 0) {
    gps.encode(gpsSerial.read());
  }
}
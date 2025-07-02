#include <Javino.h>

Javino javino;
boolean entrou = false;
boolean saiu = false;
boolean parou = false;

void setup() {
  pinMode(2, INPUT);
  pinMode(3, INPUT);
  pinMode(4, INPUT);	
  javino.perceive(getPercepcoes);
  javino.start(9600);
}

void loop() {
  javino.run();
  verificarcatraca();
 
}
void serialEvent(){
  javino.readSerial();
}

void verificarcatraca(){
if(digitalRead(2) == HIGH){
   entrou = true;
}
if(digitalRead(3) == HIGH ){
 saiu = true;
}
if(digitalRead(4) == HIGH ){
parou = true;
}



}


			void getPercepcoes() {
			  if (entrou) {
			    javino.addPercept("catraca(in)");
				entrou = false;}
				
				else if (saiu){
					javino.addPercept("catraca(out)");
					saiu = false;
			    }
				else if (parou){
					javino.addPercept("stop(stop)");
					parou = false;
				
				}
				
			}
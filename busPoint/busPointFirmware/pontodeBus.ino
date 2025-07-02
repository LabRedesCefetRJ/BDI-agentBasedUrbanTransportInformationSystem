#include <Javino.h>

Javino javino;
boolean olaria = false;
boolean centro = false;
boolean conselheiro = false;

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
   centro = true;
}
if(digitalRead(3) == HIGH ){
 olaria = true;
}
if(digitalRead(4) == HIGH ){
conselheiro = true;
}



}


			void getPercepcoes() {
			  if (centro) {
			    javino.addPercept("viagem(1)");
				centro = false;}
				
				else if (olaria){
					javino.addPercept("viagem(2)");
					olaria = false;
			    }
				else if (conselheiro){
					javino.addPercept("viagem(3)");
					conselheiro = false;
				
				}
				
			}
myUUID("0e95bdbe-39eb-4bff-a43c-10a83caa723d").
viagem(0).
 

!connect.
+!connect: hermes::contextNetConfiguration(_,_,_,_,"true",_) <- .disconnectCN; .wait(1000); !connect.
+!connect: not hermes::contextNetConfiguration(_,_,_,_,"true",_) <- .connectCN("192.168.64.71", 5500, "0e95bdbe-39eb-4bff-a43c-10a83caa723d"); .wait(2000).
 
+!viagem(V)<-
 
	-+viagem(V);
	!buscarendereco(V);

 
	 for(onibusOne(V,U)){
	 .sendOut("0a99ff05-1308-41a3-a752-173224698233", askOne, passageiros(S));
	 .print("Movimentação de passageiros no ônibus 🚶 🚌 ");
	 };
	 for(onibusOne(V,U)){
	 .sendOut("0a99ff05-1308-41a3-a752-173224698233", askOne, vaga(Va));
 
	 };
	for(onibusOne(V,U)){
	 .sendOut("0a99ff05-1308-41a3-a752-173224698233", askOne, parada(Pa));
	 .print("Ônibus quebrou ⚠️");
	 };

 
.sendOut("0a99ff05-1308-41a3-a752-173224698233" ,askAll, loc(Lat,Log));
.print("Peguei sua localização 📍");
.print("Estou a 2 minutos do Ponto 🚌 ").
 

+!buscarendereco(V) <-
.sendOut("0a99ff05-1308-41a3-a752-173224698233" ,askAll, onibusOne(V,_));
.wait(5000).
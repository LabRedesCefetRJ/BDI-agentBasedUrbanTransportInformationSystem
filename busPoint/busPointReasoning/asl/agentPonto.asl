iotGateway("10.0.3.9",5500).
myUUID("0e95bdbe-39eb-4bff-a43c-10a83caa723d").
controllerUUID("0a99ff05-1308-41a3-a752-173224698233").

!connect.

+!connect: iotGateway(Server,Port) & myUUID(ID) <- 
	.connectCN(Server,Port,ID).


+!getInfo(D)<-
	-+destination(D);
	-+attempt(5);
	!askController.

+!askController: destination(D) & controllerUUID(C) & not fleet(_,_,_,_,_,D) & attempt(T) & T>0<-
	.sendOut(C,askAll,fleet(_,running,_,_,_,D));
	-+attempt(T-1); .wait(1000); 
	!askController.

+!askController: fleet(_,_,_,_,_,D) & attempt(T) & T=5<-
	.abolish(fleet(_,_,_,_,_,_)); !askController.

+!askController: destination(D) & attempt(T) & T=0 <-
	.print("Without information about",D).

-!askController.

+fleet(A,B,C,D,E,F): destination(Dest) & F=Dest <-
	.print("Destination to: ",F," there are ",E," seats"," GPS Location ",C," ",D).

/*
+!getInfo(V)<-
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
*/
iotGateway("skynet.chon.group",5500).
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

iotGateway("10.0.3.9",5500).
myUUID("0a99ff05-1308-41a3-a752-173224698233").
!connect.

+!connect: iotGateway(Server,Port) & myUUID(ID) <- 
	.connectCN(Server,Port,ID).

+!busRunning(Status,Latitude,Longitude,Seats,Destination)[source(UUID)] <-
	.abolish(fleet(UUID,_,_,_,_,_));
	+fleet(UUID,Status,Latitude,Longitude,Seats,Destination);
	.print(Seats," seats to dest=",Destination," at ",Latitude," ",Longitude).

+!busStopped[source(UUID)] <-
	.abolish(fleet(UUID,_,_,_,_,_));
	.print("Bus ", UUID, " stopped.").
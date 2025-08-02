iotGateway("skynet.chon.group",5500).
myUUID("ba0cd5ba-70ab-49b7-90b3-2bedac71a8da").
controllerUUID("0a99ff05-1308-41a3-a752-173224698233").
destination(1). //centro

!start.

+!start: iotGateway(Server,Port) & myUUID(ID) <- 
	.connectCN(Server,Port,ID);
	!getStatus.

+!getStatus[source(S)] <- 
	.abolish(busStatus(_,_,_,_,_));
	.broadcast(askOne,busStatus(Status,Latitude,Longitude,Seats,Destination));
	.wait(busStatus(_,_,_,_,_),5000);
	!info; .random(R); .wait(10000*R); !getStatus.

-!getStatus[source(S)] <-
	!info; .random(R); .wait(10000*R); !getStatus.

+!info: busStatus(Status,Latitude,Longitude,Seats,Destination) & controllerUUID(C)<-
	.print("Informing status (OK) to controller!");
	.sendOut(C,achieve,busRunning(Status,Latitude,Longitude,Seats,Destination)).	

+!info: not busStatus(Status,Latitude,Longitude,Seats,Destination) & controllerUUID(C) <-
	.print("Informing status (STOPPED) to controller!");
	.sendOut(C,achieve,busStopped).	

-!info.
















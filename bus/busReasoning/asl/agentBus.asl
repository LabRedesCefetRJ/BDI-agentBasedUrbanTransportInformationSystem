busStatus(A,B,C,D,E) :- busStatus(A) & latitude(B) & longitude(C) & passagerLimit(D) & destination(E).
passagerLimit(45).
serialPort(ttyEmulatedPort0).		/* when using the simulIDE */
//serialPort(ttyUSB0).			/* when using an arduino board */

!start.

+!start: serialPort(Port) <-
	.port(Port); 
	.limit(500); 
	.percepts(open).

+passager(in) <- ?passagerLimit(L); -+passagerLimit(L-1).
+passager(out) <- ?passagerLimit(L); -+passagerLimit(L+1).

/*****************************/
+passagerLimit(V): V<=45 <- .print("Seats ",V).
+passagerLimit(V): V>45 <- -+passagerLimit(45).
+busStatus(S) <- .print("The bus is ",S).
+destination(D) <- .print("Destination is: ",D).
+device(N) <- .print("Controlling the device: ",N).
//+latitude(Lat) <- .print("Latitude: ",Lat).
//+longitude(Long)<- .print("Longitude:",Long).
+port(P,S) <- .print("Serial port ",P," is ",S).

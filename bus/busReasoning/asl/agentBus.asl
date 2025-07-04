busStatus(A,B,C,D,E) :- busStatus(A) & lat(B) & lng(C) & seats(D) & dest(E).
seats(45).
serialPort(ttyEmulatedPort0).		/* when using the simulIDE */
//serialPort(ttyUSB0).			/* when using an arduino board */

!start.

+!start: serialPort(Port) <-
	.port(Port); 
	.limit(500); 
	.percepts(open).

+passager(in) <- ?seats(L); -+seats(L-1).
+passager(out) <- ?seats(L); -+seats(L+1).

/*****************************/
+seats(V): V<=45 <- .print("Seats ",V).
+seats(V): V>45 <- -+seats(45).
+busStatus(S) <- .print("The bus is ",S).
+dest(D) <- .print("Destination is: ",D).
+device(N) <- .print("Controlling the device: ",N).
+lat(Lat) <- .print("Latitude: ",Lat).
+lng(Long)<- .print("Longitude:",Long).
+port(P,S) <- .print("Serial port ",P," is ",S).

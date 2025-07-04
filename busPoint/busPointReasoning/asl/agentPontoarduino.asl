serialPort(ttyEmulatedPort1).		/* when using the simulIDE */
//serialPort(ttyUSB1).			/* when using an arduino board */
 
!start.
 
+!start: serialPort(Port) <-
	.port(Port); 
	.limit(1000); 
	.percepts(open).
 
+dest(V) <-
	.print("Requesting info to ",V);
	.send(agentPonto, achieve, getInfo(V)).

	/*****************************/
+dest(D) <- .print("Destination is: ",D).
+device(N) <- .print("Controlling the device: ",N).
+port(P,S) <- .print("Serial port ",P," is ",S).

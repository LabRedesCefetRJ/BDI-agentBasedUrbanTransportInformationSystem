serialPort(ttyEmulatedPort2).		/* when using the simulIDE */
//serialPort(ttyUSB2).			/* when using an arduino board */
 
!start.
 
+!start: serialPort(Port) <-
	.port(Port); 
	.limit(1000); 
	.percepts(open).
 
+viagem(V) <-
	.send(agentPonto, achieve, viagem(V)).
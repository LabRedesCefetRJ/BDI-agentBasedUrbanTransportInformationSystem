serialPort(ttyEmulatedPort0).		/* when using the simulIDE */
//serialPort(ttyUSB0).			/* when using an arduino board */

!start.

+!start: serialPort(Port) <-
	.port(Port); 
	.limit(1000); 
	.percepts(open).

+catraca(S) <-
	.wait(500);
	.send(agentBusC, achieve, catraca(S)).

+stop(P) <-
	.send(agentBusC, achieve, bus(P)).

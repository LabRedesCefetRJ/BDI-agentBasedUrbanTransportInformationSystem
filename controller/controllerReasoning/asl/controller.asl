
//.connectCN("skynet.chon.group", 5500, "0a99ff05-1308-41a3-a752-173224698233");

myUUID("0a99ff05-1308-41a3-a752-173224698233").
passageiros(0).
vaga(disponivel).
parada(ativo).

!connect.

+!connect: not hermes::contextNetConfiguration(_,_,_,_,"true",_) <- 
	.connectCN("192.168.64.71", 5500, "0a99ff05-1308-41a3-a752-173224698233");
 	.wait(10000).

+!ocupacao(P1)[source(S)] <-
	-+passageiros(P1).

+!quebrou(Q)[source(S)] <-
	-+parada(Q).

+!statusvaga(SV)[source(S)] <-
	-+vaga(SV).
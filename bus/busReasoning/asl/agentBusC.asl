//.connectCN("skynet.chon.group", 5500, "ba0cd5ba-70ab-49b7-90b3-2bedac71a8da");

myUUID("ba0cd5ba-70ab-49b7-90b3-2bedac71a8da").

passageiros(0).
status(ativo).
linha(1). //centro
capacidadeTotal(5).
vaga(disponivel).
valorPassagem(5.50).
lat(-22.238751).
log(-42.521281).

!start.


+!connect: hermes::contextNetConfiguration(_,_,_,_,"true",_) <- .disconnectCN; .print("DEsconectado..."); .wait(1000); !connect.
+!connect: not hermes::contextNetConfiguration(_,_,_,_,"true",_) <- .connectCN("192.168.64.71", 5500, "ba0cd5ba-70ab-49b7-90b3-2bedac71a8da"); .print("connectado"); .wait(2000).

+!start<-
	!connect;
	?linha(L);
	?myUUID(U);
	?lat(Lat);
	?log(Log);
	?vaga(V);
	?valorPassagem(Vp);
	.sendOut("0a99ff05-1308-41a3-a752-173224698233",tell, [valorP(Vp),loc(Lat,Log),vaga(V),onibusOne(L,U)]);
.


+!catraca(in): passageiros(P) & capacidadeTotal(C) & status(ativo) & P <  C <-
    -passageiros(P);
     P1 = P + 1;
    +passageiros(P1);
    .print("Numero de passageiros: ", P1);
    !connect;
    .sendOut("0a99ff05-1308-41a3-a752-173224698233",achieve, ocupacao(P1));
.
   

+!catraca(in) : passageiros(P) & capacidadeTotal(C) & status(ativo) & P >= C <-
    	-+vaga(indisponivel);
     	.print("Onibus lotado").

+!catraca(out) : passageiros(P) & status(ativo) <-
	-passageiros(P);
	P1 = P - 1;
	+passageiros(P1);
	.print("Passageiro saiu. Total atualizado: ", P1).
    


+!bus(stop) : status(ativo) <-
	.print("ALERTA: ônibus parado por falha!");
	-status(ativo);
	+status(parado).


+!catraca(in) : status(parado) <-
	.print("Ônibus parado. Entrada ignorada.").

+!catraca(out) : status(parado) <-
	.print("Ônibus parado. Saída ignorada.").


	
















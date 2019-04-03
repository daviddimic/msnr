-module(trougao).
-export([loop/0, klijent/2]). 
-import(math, [sqrt/1]).


klijent(Pid, Request) ->
    Pid ! {self(), Request},
    receive
	{Pid, Response} ->
	    Response
    end.


loop() ->
    receive
	{From, {hipotenuza, A, B}} -> 
	    From ! {self(), sqrt(A*A + B*B)},
	    loop();
	{From, {povrsina, A, B}} -> 
	    From !  {self(), A * B / 2},
	    loop();
	{From, Other} ->
	    From ! {self(), {error, Other}},
	    loop()
    end.


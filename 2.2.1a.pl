course(complexity, time(monday,9,15), lecturer(david,harel),
       location(feinberg,a)).

course(math, time(monday,9,11), lecturer(nick,gerald),
       location(wineberg,b)).


location(X,Y):-
    course(X,_,_,location(Y,_)).

busy(X,Y):-
    course(_,time(_,Z,V),lecturer(_,X),_),
Y >= Z, Y =< V.

cannot_meet(X,Y):-
    course(_,time(A,B,C),lecturer(_,X),_),
    course(_,time(A1,B1,C1),lecturer(_,Y),_),
    A = A1,
    (busy(X,B1), busy(X,C1);
    busy(Y,B), busy(Y,C)).



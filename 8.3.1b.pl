power(X, N, Y) :-
    power(X, N, 1 , Y).

power(X, N, Y, S) :-
    not(X = 1),
    not(X = 0),
    N > 0,
    N1 is N-1,
    Z is X * Y,
    power(X, N1, Z, S).

power(_, 0, X,X).
power(0, _, 1,0).
power(_, 0, 1, 1).
power(1,_, 1, 1).

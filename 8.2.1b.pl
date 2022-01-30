power(X, N, Y) :-
    N > 0,
    not(X = 1),
    not(X = 0),
    N1 is N-1,
    power(X, N1, Z),
    Y is X * Z.

power(0, _, 0).
power(_, 0, 1).
power(1,_, 1).

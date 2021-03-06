substitute(_,_,[],[]).

substitute(X, Y, [X|Xs], [Y|Ys]) :-
    substitute(X, Y, Xs, Ys).

substitute(X, Y, [Z|Zs], [Z|Ys]) :-
    not(X = Z),
    substitute(X, Y, Zs, Ys).

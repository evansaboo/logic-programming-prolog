pSort(Xs,Ys) :-
    permutation(Xs,Ys),
    ordered(Ys).

permutation([],[]).
permutation(Xs,[Z|Zs]) :-
    select(Z,Xs,Ys),
    permutation(Ys,Zs).

ordered([]).
ordered([X]).
ordered([X,Y|Ys]) :-
    X =< Y,
    ordered([Y|Ys]).

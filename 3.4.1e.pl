oPath(X,tree(X,_,_),[X]).
oPath(X,tree(Y,Left,_),[Y|Ys]) :-
    X < Y,
    path(X,Left,Ys).

oPath(X,tree(Y,_,Right),[Y|Ys]) :-
    X > Y,
    path(X,Right,Ys).


uPath(X,tree(X,_,_),[X]).

uPath(X,tree(Y,Left,Right),[Y|Ys]) :-
    path(X,Left,Ys);
    path(X,Right,Ys).

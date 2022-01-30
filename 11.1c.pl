insert_sort([X|Xs],Ys) :-
    insert_sort(Xs,Zs),
    insert(X,Zs,Ys).
insert_sort([],[]).

insert(X,[],[X]) :- !.
insert(X,[Y|Ys],[Y|Zs]) :-
    X > Y,!, insert(X,Ys,Zs).
insert(X,[Y|Ys],[X,Y|Ys]):-
    X=<Y.

/*
stable_m(
[p(zvia, [elazar, avraham, david, binyamin, chaim]),
p(chana, [david, elazar, binyamin, avraham, chaim]),
p(ruth, [avraham, david, binyamin, chaim, elazar]),
p(sarah, [chaim, binyamin, david, avraham, elazar]),
p(tamar, [david, binyamin, chaim, elazar, avraham])
],
[
p(avraham, [chana, tamar, zvia, ruth, sarah]),
p(binyamin, [zvia, chana, ruth, sarah, tamar]),
p(chaim, [chana, ruth, tamar, sarah, zvia]),
p(david, [zvia, ruth, chana, sarah, tamar]),
p(elazar, [tamar, ruth, chana, zvia, sarah])
], X).

 */
stable_m(X, Y, D):-
    stable_m1(X, Y, [], D).

stable_m1(_,W, D,D):-
    length(D, L),
    length(W, F),
    L =F ,!.

stable_m1(X, Y, Ms, D):-
    stable_marriage(X, Y, Ms, Mss,Ps),
    stable_m1(Ps, Y, Mss, D).

stable_marriage([],_, Ms, Ms, []):-!.

stable_marriage([p(X,[Y|Ys])|Rs],Ws, Ms, Mds, [p(X,[Y|Ys])|Ps]) :-
    member(m(X,_), Ms),!,
    stable_marriage(Rs,Ws,Ms, Mds, Ps).


stable_marriage([p(X,[Y|Ys])|Rs],Ws, Ms, Mds, [p(X,Ys)|Ps]) :-
    not(member(m(_,Y), Ms)),
    member(p(Y,_), Ws),!,
    M = m(X,Y),
    stable_marriage(Rs,Ws,[M|Ms], Mds, Ps).

stable_marriage([p(M,[Mp|Mps])|Rs],Ws,Ms, Mds,[p(M,Mps)|Ps] ) :-
    member(m(F,Mp), Ms),
    prio(F,(m(M,Mp)), Ws, Ans),
    Ans = M,!,
    replace(M, F, Ms, Mss),
    stable_marriage(Rs, Ws, Mss, Mds, Ps).

stable_marriage([p(M,[_|Mps])|Rs],Ws,Ms, Mds, Ps) :-
    stable_marriage([p(M, Mps)|Rs], Ws, Ms, Mds, Ps).


prio(F, m(M,Mp), Ws, A):-
    member(p(Mp,L),Ws),
    prio1(F, M, L, A), !.

prio1(F, _, [F|_], F) :-!.
prio1(_, M, [M|_], M):-!.
prio1(F, M, [_|Wps], A):-
    prio1(F, M, Wps, A).

replace(X, Y, [m(Y,F)|Ms], [m(X,F)|Ms]) :-!.
replace(X, Y, [M|Ms], [M|Mss]):-
    replace(X, Y, Ms, Mss).

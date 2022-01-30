range(M,N,Ns) :-
    range(M,N,[M],Ns).

range(M,N,Ns, Xs) :-
    M < N,
    M1 is M +1,
   range(M1, N, [M1|Ns], Xs).

range(N,N,Ns,Ns).

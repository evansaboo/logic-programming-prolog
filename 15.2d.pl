/*op(600,xfy,+*)*/

normalize(Exp, Norm):-
    normalize_pd(Exp, Norm+*1).

normalize_pd(A*B, Norm+*Space) :-
    normalize_pd(A,Norm+*NormB),
    normalize_pd(B, NormB+*Space).

normalize_pd(A, (A*Space)+*Space) :-
    atom(A); number(A).


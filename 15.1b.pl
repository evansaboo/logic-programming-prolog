preorder(T, X) :-
    preorder1(T,X-[]).

preorder1(tree(X,L,R),Xs) :-
    preorder1(L,Ls),
    preorder1(R,Rs),
    app([X|S]-S,Ls,Ls1),
    app(Ls1,Rs,Xs).

preorder1(void,[]).

inorder(T, X) :-
    inorder1(T,X-[]).

inorder1(tree(X,L,R),Xs):-
    inorder1(L,Ls),
    inorder1(R,Rs),
    app([X|S]-S,Rs,Rs1),
    app(Ls, Rs1,Xs).

inorder1(void,[]).

postorder(T, X) :-
    postorder1(T,X-[]).

postorder1(tree(X,L,R), Xs):-
    postorder1(L,Ls),
    postorder1(R,Rs),
    app(Rs,[X|S]-S,Rs1),
    app(Ls,Rs1,Xs).
postorder1(void,[]).

app(X,[],X).
app([],X,X).
app(A-B, B-C,A-C).

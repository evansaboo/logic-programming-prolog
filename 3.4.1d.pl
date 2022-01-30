tree_insert(X,tree(X,Y,Z), tree(X,Y,Z)).
tree_insert(X,void,tree(X,void,void)).
tree_insert(X,tree(Y,Left,Right), tree(Y,Z,Right)):-
    Y > X,
    tree_insert(X,Left, Z).

tree_insert(X,tree(Y,Left,Right), tree(Y,Left,Z)):-
    Y < X,
    tree_insert(X,Right, Z).


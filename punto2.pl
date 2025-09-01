estadounidense(west).
armas(misiles).
vende(west, misiles, coreasur).

hostil(coreasur).

crimen(X) :- 
    estadounidense(X), 
    vende(X, Y, Z), 
    armas(Y), 

    hostil(Z).

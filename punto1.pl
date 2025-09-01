% =====================
% Hechos
% =====================

padre_de(abraham, herbert).
padre_de(abraham, homero).
padre_de(clancy, patty).
padre_de(clancy, selma).
padre_de(clancy, marge).
padre_de(homero, bart).
padre_de(homero, lisa).
padre_de(homero, maggie).

madre_de(mona, homero).
madre_de(jacqueline, patty).
madre_de(jacqueline, selma).
madre_de(jacqueline, marge).
madre_de(marge, bart).
madre_de(marge, lisa).
madre_de(marge, maggie).
madre_de(selma, ling).

es_mujer(mona).
es_mujer(jacqueline).
es_mujer(marge).
es_mujer(patty).
es_mujer(selma).
es_mujer(lisa).
es_mujer(maggie).
es_mujer(ling).

es_hombre(abraham).
es_hombre(herbert).
es_hombre(homero).
es_hombre(clancy).
es_hombre(bart).

% =====================
% Reglas
% =====================

% Abuelos
abuelo_de(X, Y) :- 
    X \= Y, es_hombre(X),
    padre_de(X,Z), (padre_de(Z,Y) ; madre_de(Z,Y)).

abuela_de(X, Y) :- 
    X \= Y, es_mujer(X),
    madre_de(X,Z), (padre_de(Z,Y) ; madre_de(Z,Y)).

% Hermanos
hermano_de(X, Y) :- 
    X \= Y, es_hombre(X),
    ((madre_de(Z, X), madre_de(Z, Y)) ;
     (padre_de(W, X), padre_de(W, Y))).

hermana_de(X, Y) :- 
    X \= Y, es_mujer(X),
    ((madre_de(Z, X), madre_de(Z, Y)) ;
     (padre_de(W, X), padre_de(W, Y))).

% Tíos y tías
tio_de(X, Y) :- 
    X \= Y, es_hombre(X),
    ( (madre_de(M,Y), hermano_de(X,M)) ;
      (padre_de(P,Y), (hermano_de(X,P) ; hermana_de(X,P))) ).

tia_de(X, Y) :- 
    X \= Y, es_mujer(X),
    ( (madre_de(M,Y), hermana_de(X,M)) ;
      (padre_de(P,Y), (hermano_de(X,P) ; hermana_de(X,P))) ).

% Hijos
hijo_de(X, Y) :- 
    X \= Y, es_hombre(X),
    (padre_de(Y, X) ; madre_de(Y, X)).

hija_de(X, Y) :- 
    X \= Y, es_mujer(X),
    (padre_de(Y, X) ; madre_de(Y, X)).

% Primos
primo_de(X, Y) :-
    X \= Y, es_hombre(X),
    ( padre_de(P,X), padre_de(Q,Y), (hermano_de(P,Q) ; hermana_de(P,Q)) ;
      madre_de(M,X), padre_de(Q,Y), (hermano_de(M,Q) ; hermana_de(M,Q)) ;
      padre_de(P,X), madre_de(Q,Y), (hermano_de(P,Q) ; hermana_de(P,Q)) ;
      madre_de(M,X), madre_de(Q,Y), (hermano_de(M,Q) ; hermana_de(M,Q)) ).

prima_de(X, Y) :-
    X \= Y, es_mujer(X),
    ( padre_de(P,X), padre_de(Q,Y), (hermano_de(P,Q) ; hermana_de(P,Q)) ;
      madre_de(M,X), padre_de(Q,Y), (hermano_de(M,Q) ; hermana_de(M,Q)) ;
      padre_de(P,X), madre_de(Q,Y), (hermano_de(P,Q) ; hermana_de(P,Q)) ;
      madre_de(M,X), madre_de(Q,Y), (hermano_de(M,Q) ; hermana_de(M,Q)) ).

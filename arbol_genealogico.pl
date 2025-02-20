% Programación III
% Juan Camilo Castaño.
% codigo:1193521035
% Árbol genealógico "LOS SIMPSON"

% Género
es_hombre(abraham).
es_hombre(clancy).
es_hombre(herbert).
es_hombre(homero).
es_hombre(bart).

es_mujer(mona).
es_mujer(jacqueline).
es_mujer(marge).
es_mujer(patty).
es_mujer(selma).
es_mujer(lisa).
es_mujer(maggie).
es_mujer(ling).

% Relaciones padre e hijo
padre_de(abraham, herbert).
padre_de(abraham, homero).
padre_de(clancy, marge).
padre_de(clancy, patty).
padre_de(clancy, selma).
padre_de(homero, bart).
padre_de(homero, lisa).
padre_de(homero, maggie).

% Relaciones madre e hijo
madre_de(mona, herbert).
madre_de(mona, homero).
madre_de(jacqueline, marge).
madre_de(jacqueline, patty).
madre_de(jacqueline, selma).
madre_de(marge, bart).
madre_de(marge, lisa).
madre_de(marge, maggie).
madre_de(selma, ling).


% Reglas de las Relaciones familiares
abuelo_de(Abuelo, Nieto) :-
    (padre_de(Abuelo, Padre), padre_de(Padre, Nieto));
    (padre_de(Abuelo, Madre), madre_de(Madre, Nieto)).

abuela_de(Abuela, Nieto) :-
    (madre_de(Abuela, Madre), madre_de(Madre, Nieto));
    (madre_de(Abuela, Padre), padre_de(Padre, Nieto)).

hermano_de(Herm1, Herm2) :-
    (madre_de(Madre, Herm1), madre_de(Madre, Herm2), es_hombre(Herm1));
    (padre_de(Padre, Herm1), padre_de(Padre, Herm2), es_hombre(Herm1)).

hermana_de(Herm1, Herm2) :-
    (madre_de(Madre, Herm1), madre_de(Madre, Herm2), es_mujer(Herm1));
    (padre_de(Padre, Herm1), padre_de(Padre, Herm2), es_mujer(Herm1)).

tio_de(Tio, Sobrino) :-
    (hermano_de(Tio, Padre), padre_de(Padre, Sobrino), es_hombre(Tio));
    (hermano_de(Tio, Madre), madre_de(Madre, Sobrino), es_hombre(Tio)).

tia_de(Tia, Sobrino) :-
    (hermana_de(Tia, Padre), padre_de(Padre, Sobrino), es_mujer(Tia));
    (hermana_de(Tia, Madre), madre_de(Madre, Sobrino), es_mujer(Tia)).

primo_de(P1, P2) :-
    (padre_de(Tio, P1), tio_de(Tio, P2));
    (madre_de(Tia, P1), tio_de(Tia, P2)).
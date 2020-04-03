-- compléter l'entête 
-- ==================

-- NOM    :
-- Prénom :

-- NOM    :
-- Prénom :

-- Groupe :
-- binome :

-- ================================================

set sqlbl on


-- nettoyer le compte
@vider

-- Définition des types de données

prompt essai



create type Matiere as object(
 nom VARCHAR2(30),
 prix  NUMBER(4),
 masse_volumique NUMBER(3));
@compile

create type Piece as object(
	nom varchar2(30)
) not final;
@compile

create type PBase under Piece(
 est_en ref Matiere,
 not instantiable member function volume return Number,
 not instantiable member function masse return Number,
 not instantiable member function prix return Number
) not final not instantiable;
@compile

create type Cube under PBase(
cote number(10),
overriding member function volume return Number,
overriding member function masse return Number,
overriding member function prix return Number
);
@compile

create type Sphere under PBase(
rayon number(10),
overriding member function volume return Number,
overriding member function masse return Number,
overriding member function prix return Number
);
@compile

create type Cylindre under PBase(
diametre number(3),
hauteur number(3),
overriding member function volume return Number,
overriding member function masse return Number,
overriding member function prix return Number
);
@compile

create type Parallelepipede under PBase(
hauteur number(3),
longueur number(3),
largeur number(3),
overriding member function volume return Number,
overriding member function masse return Number,
overriding member function prix return Number
);
@compile

create type PieceQuantite as object(
quantite number(5),
piece ref PBase
);
@compile

create type EnsPieceQuantite as table of PieceQuantite;
@compile

create type PComposite under Piece(
cout number(4),
composeDe EnsPieceQuantite,
member function nb_pieces_base return Number,
member function composee_de return EnsPiece
);
@compile

create type EnsPiece as table of PBase;
@compile

desc PComposite

@liste

select  * from LesPBases;




drop table LesMatieres;

-- liste de tous les types créés
@liste


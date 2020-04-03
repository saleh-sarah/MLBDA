-- compléter l'entête 
-- ==================

-- NOM    :
-- Prénom :

-- NOM    :
-- Prénom :

-- Groupe :
-- binome :

-- ================================================

-- stockage des données : définition des relations
-- ====================

create table LesMatieres of Matiere;

create table LesPieces of Piece;

create table LesPBases of PBase;

create table LesPComposites of PComposite
nested table composeDe store as Y;

create table LesPieceQuantites of PieceQuantite;


-- instanciation des objets
-- ========================

insert into LesMatieres values(Matiere('bois',10,2));
insert into LesMatieres values(Matiere('fer', 5,3));
insert into LesMatieres values(Matiere('ferrite', 6,10));
@compile

create or replace procedure insere_pieces_de_base as
begin
insert into LesPBases values(Cylindre('canne',(
       select ref(m)
       from LesMatieres m
       where m.nom='bois'), 2,30),
insert into LesPBases values(Parallelepipede('plateau',(
       select ref(m)
       from LesMatieres m
       where m.nom='bois'), 1,100,80),
insert into LesPBases values(Sphere('pied',(
       select ref(m)
       from LesMatieres m
       where m.nom='bois'), 30),
insert into LesPBases values(Cylindre('clou',(
       select ref(m)
       from LesMatieres m
       where m.nom='fer'), 1,20),
insert into LesPBases values(Sphere('boule',(
       select ref(m)
       from LesMatieres m
       where m.nom='fer'), 30),
insert into LesPBases values(Cylindre('aimant',(
       select ref(m)
       from LesMatieres m
       where m.nom='ferrite'), 2,5)
end;
@compile


create or replace procedure insere_pieces_composites as
begin
insert into LesPComposites values('table', 100, EnsPieceQuantite(Piece
end;
@compile

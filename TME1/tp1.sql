-- MABD TP1 SQL avec la base MONDIAL


-- -------------------- binome -------------------------
-- NOM
-- Prenom

-- NOM
-- Prenom
-- -----------------------------------------------------

-- pour se connecter à oracle:
-- sqlplus E1234567/E1234567@oracle
-- remplacer E12345657 par la lettre E suivie de votre numéro de login

@mondial_synonym

set sqlbl on
set linesize 150

prompt schema de la table Country
desc Country

prompt schema de la table City
desc City

prompt schema de la table IsMember
desc IsMember

prompt schema de la table City
desc City

-- pour afficher un nuplet entier sur une seule ligne
column name format A15
column capital format A15
column province format A20

-- Requete 0

select * from Country where name = 'France';

-- Requete 12
select distinct c.name, m.name, m.height
from mountain m, encompasses e, country c, geo_mountain gm
where e.continent='America' and e.country=c.code and m.name=gm.mountain and gm.country=c.code
and not exists (select *
    	       from mountain m2, encompasses e2, country c2, geo_mountain gm2
	       where m2.height>m.height and m.name<>m2.name and e2.continent='America' and e2.country=c2.code
	       and m2.name=gm2.mountain and gm2.country=c2.code and c.code=c2.code);
	     

select * from mondial.R12;

select c.name, m.name, m.height
from country c, mountain m,  geo_mountain gm
where m.name=gm.mountain and gm.country=c.code
intersect (select c.name, max(m.height) as maxH
      from mountain m, encompasses e, country c, geo_mountain gm
      where e.continent='America' and e.country=c.code and m.name=gm.mountain and gm.country=c.code
      group by c.name, c.code);


-- requete 13
select * from mondial.R13;

select r.name
from river r
where r.river='Nile';

-- requete 14
select * from mondial.R14;

select distinct r0.name
from river r1, river r2, river r0
where r0.river='Nile' or (r0.river=r1.name and r1.river='Nile') or (r1.river=r2.name and r2.river='Nile' and r0.river = r1.name);

-- requete 15
select * from mondial.R15;

select sum(r.length)
from river r
where r.name in (select distinct r0.name
from river r1, river r2, river r0
where r0.river='Nile' or (r0.river=r1.name and r1.river='Nile') or (r1.river=r2.name and r2.river='Nile' and r0.river = r1.name)) or r.name = 'Nile';

-- requete 16 a
select * from mondial.R16a;

select i.organization, count(*) as nbpays
from ismember i, country c
where i.country=c.code and not exists (select *
      		       	       	      from ismember i


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


create or replace type body Cube as
       overriding member function volume return Number is
       res1 Number;
       begin
       select (self.cote*self.cote)
       into res1
       from dual;
       return res1;
	end;
	overriding member function masse return Number is
	 res Number;
	 begin
	 select self.volume()*deref(self.est_en).masse_volumique
	 into res
	 from dual;
	 return res;
	 end;
	overriding member function prix return Number is
	 res Number;
	 begin
	 select self.masse()*deref(self.est_en).prix
	 into res
	 from dual;
	 return res;
	 end;
end;
@compile


create or replace type body PComposite as
       member function nb_pieces_base return Number is
       res Number;
       begin
       select count(deref(c.piece))
       into res
       from table(self.composeDe) c
       return res;
       end;
       member function composee_de return EnsPiece is
       res EnsPiece;
       begin
       select PBase(deref(c.piece).nom, c.piece.est_en)
       bulk collect into res
       from table(self.composeDe) c
       return res;
       end;
end;
@compile



/*
create or replace type body Cube as
       overriding member function volume return Number is
       begin
	return self.cote*self.cote;
	end;
	 overriding member function masse return Number is
	 res Number;
	 begin
	 select v*value(m.masse_volumique)
	 into res
	 from value(self.est_en) m, self.volume() v;
	 return res;
	 end;
end;
@compile
--
--create or replace type body Cube as
 --      overriding member function masse return Number is
 --      res Number;
 --      begin
--	select v*value(m.masse_volumique)
--	into res
--	from value(self.est_en) m, self.volume() v;
--	return res;
--	end;
--end;
--@compile
--
*/

(: afficher tous les tournois (lieu,année) triés par année, puis lieu. Utiliser la fonction distinct-values(…) pour obtenir un ensemble sans doubles. :)

(: <tournois>{
  for $a in //rencontre
  order by $a/annee, $a/lieutournoi
  return <tournoi lieu="{$a/lieutournoi}" annee="{$a/annee}"> </tournoi>
}</tournois> :)

(: <tournois>{
  let $t := <tournois>{for $a in //rencontre
  order by $a/annee, $a/lieutournoi
  return <tournoi lieu="{$a/lieutournoi}" annee="{$a/annee}"> </tournoi>} </tournois>
  for $a in distinct-values($t/tournoi/@annee), $l in distinct-values($t/tournoi[@annee = $a]/@lieu)
  return <tournoi lieu="{$l}" annee="{$a}"></tournoi>
}</tournois> :)

(: 
pour chaque tournoi (lieu, année) donner les nom et prénom des participants qui sont dans le fichier gain.xml :)

(: <tournois>{
  let $t := <tournois>{for $a in //rencontre
  order by $a/annee, $a/lieutournoi
  return <tournoi lieu="{$a/lieutournoi}" annee="{$a/annee}"> </tournoi>} </tournois> 
  for $a in distinct-values($t/tournoi/@annee), $l in distinct-values($t/tournoi[@annee = $a]/@lieu)
  return <tournoi lieu="{$l}" annee="{$a}">
  {for $g in //gain , $j in //joueur[nujoueur = $g/nujoueur]
  where $g/lieutournoi=$l and $g/annee=$a 
  return <participant nom="{$j/nom}" prenom="{$j/prenom}"> </participant>
  } 
</tournoi>
}</tournois> :)


(: pour chaque année, donner le nombre tournois auxquels chaque joueur a participé. pour chaque année, donner le nombre tournois auxquels chaque joueur a participé.  :)

<reponse> {let $t := <tournois>{for $a in //rencontre
  order by $a/annee
  return <annee valeur="{$a/annee}"> </annee>} </tournois> 
  for $a in distinct-values($t/tournoi/@annee)
  where
  return <annee valeur="{$a/annee}"> {
    for $j in //joueur 
    where some $x in $j/* satisfies($)
    return <joueur nom="{}" tournois="{}">
    </joueur>
  } </annee>


}</reponse>


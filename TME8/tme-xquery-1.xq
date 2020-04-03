(: for $r in //rencontre
return $r :)

(: for $p in //person
where $p/@id = "person0"
return $p/name :)

(: for $a in //open_auctions/auction[position() <= 3]
return $a/initial :)


(:  for $a in //open_auctions/auction[position() <= 3]
 return 
 <result id="{$a/@id}">
 <first>{$a/bidder[position() = 1]/increase}</first>
  <last>{$a/bidder[last()]/increase}</last>
 </result> :)
 


(: for $a in //closed_auctions/auction
where $a/price > 480
return $a/price :)

(: for $r in //africa
return $r/item/name :)

(: for $r in //africa/item, $i in //closed_auctions/auction 
where $i/itemref/@item = $r/@id
return 
<res>
<name> {$r/name}</name>
<price> {$i/price}</price>
</res> :)


(: let $cpt := count(
for $p in //person 
where empty($p/homepage)
return $p)
return $cpt :)


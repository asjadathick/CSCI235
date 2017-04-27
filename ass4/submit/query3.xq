for $j in distinct-values(//bookshop/product[comments]/@ID)
return
  if (not(empty(//book[@IDREF=$j])) or not(empty(//journal[@IDREF=$j]))) then (
<product>
	{//book[@IDREF=$j]/title | //journal[@IDREF=$j]/title}
</product>

) else ()